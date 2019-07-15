/*
 * Copyright (c) 2013, The Linux Foundation. All rights reserved.
 * Copyright (C) 2018 The LineageOS Project
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * *    * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of The Linux Foundation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#define LOG_NIDEBUG 0

#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dlfcn.h>
#include <stdlib.h>

#define LOG_TAG "QCOM PowerHAL"
#include <log/log.h>
#include <hardware/hardware.h>
#include <hardware/power.h>

#include "utils.h"
#include "metadata-defs.h"
#include "hint-data.h"
#include "performance.h"
#include "power-common.h"

/**
 * Returns true if the target is APQ8064.
 */
static bool is_target_8064(void)
{
    static int is_8064 = -1;
    int soc_id;

    if (is_8064 >= 0)
        return is_8064;

    soc_id = get_soc_id();
    is_8064 = soc_id == 153;

    return is_8064;
}

static int current_power_profile = PROFILE_BALANCED;

static int profile_high_performance_8960[] = {
    CPUS_ONLINE_MIN_2,
};

static int profile_high_performance_8064[] = {
    CPUS_ONLINE_MIN_4,
};

static int profile_power_save_8960[] = {
    /* Don't do anything for now */
};

static int profile_power_save_8064[] = {
    CPUS_ONLINE_MAX_LIMIT_2,
};

#ifdef INTERACTION_BOOST
int get_number_of_profiles()
{
    return 3;
}
#endif

static int set_power_profile(void *data)
{
    int profile = data ? *((int*)data) : 0;
    int ret = -EINVAL;
    const char *profile_name = NULL;

    if (profile == current_power_profile)
        return 0;

    ALOGV("%s: Profile=%d", __func__, profile);

    if (current_power_profile != PROFILE_BALANCED) {
        undo_hint_action(DEFAULT_PROFILE_HINT_ID);
        ALOGV("%s: Hint undone", __func__);
        current_power_profile = PROFILE_BALANCED;
    }

    if (profile == PROFILE_POWER_SAVE) {
        int* resource_values = is_target_8064() ?
                profile_power_save_8064 : profile_power_save_8960;

        ret = perform_hint_action(DEFAULT_PROFILE_HINT_ID,
                resource_values, ARRAY_SIZE(resource_values));
        profile_name = "powersave";

    } else if (profile == PROFILE_HIGH_PERFORMANCE) {
        int *resource_values = is_target_8064() ?
                profile_high_performance_8064 : profile_high_performance_8960;

        ret = perform_hint_action(DEFAULT_PROFILE_HINT_ID,
                resource_values, ARRAY_SIZE(resource_values));
        profile_name = "performance";

    } else if (profile == PROFILE_BALANCED) {
        ret = 0;
        profile_name = "balanced";
    }

    if (ret == 0) {
        current_power_profile = profile;
        ALOGD("%s: Set %s mode", __func__, profile_name);
    }
    return ret;
}

int power_hint_override(power_hint_t hint, void *data)
{
    if (hint == POWER_HINT_SET_PROFILE) {
        if (set_power_profile(data) < 0)
            ALOGE("Setting power profile failed. perfd not started?");
        return HINT_HANDLED;
    }

    // Skip other hints in high/low power modes
    if (current_power_profile == PROFILE_POWER_SAVE ||
            current_power_profile == PROFILE_HIGH_PERFORMANCE) {
        return HINT_HANDLED;
    }

    return HINT_NONE;
}

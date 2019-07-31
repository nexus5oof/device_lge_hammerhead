#
# Copyright (C) 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL hammerhead devices, and
# are also specific to hammerhead devices
#
# Everything in this directory will become public

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

PRODUCT_COPY_FILES += \
    device/lge/hammerhead/rootdir/init.hammerhead.rc:root/init.hammerhead.rc \
    device/lge/hammerhead/rootdir/init.hammerhead.usb.rc:root/init.hammerhead.usb.rc \
    device/lge/hammerhead/rootdir/fstab.hammerhead:root/fstab.hammerhead \
    device/lge/hammerhead/rootdir/ueventd.hammerhead.rc:root/ueventd.hammerhead.rc

# Input device files for hammerhead
PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/input/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lge/hammerhead/configs/input/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
    device/lge/hammerhead/configs/input/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    device/lge/hammerhead/configs/input/qpnp_pon.kcm:system/usr/keychars/qpnp_pon.kcm \
    device/lge/hammerhead/configs/input/Button_Jack.kl:system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl \
    device/lge/hammerhead/configs/input/Button_Jack.kcm:system/usr/keychars/msm8974-taiko-mtp-snd-card_Button_Jack.kcm \
    device/lge/hammerhead/configs/input/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/lge/hammerhead/configs/input/hs_detect.kcm:system/usr/keychars/hs_detect.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/input/touch_dev.idc:system/usr/idc/touch_dev.idc

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/lge/hammerhead/configs/media/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    device/lge/hammerhead/configs/media/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/lge/hammerhead/configs/media/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/lge/hammerhead/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/lge/hammerhead/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/lge/hammerhead/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# For GPS
PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/sec_config:system/etc/sec_config

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    device/lge/hammerhead/configs/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    device/lge/hammerhead/configs/nfc/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf

PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/lge/hammerhead/overlay

PRODUCT_PACKAGES := \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Lineage hals
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sysfs

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    gralloc.msm8974 \
    libgenlock \
    android.hardware.graphics.composer@2.1-impl \
    hwcomposer.msm8974 \
    android.hardware.memtrack@1.0-impl \
    memtrack.msm8974 \
    libqdutils \
    libqdMetaData

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    audio.primary.msm8974 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# Audio effects
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@2.0-impl \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/media/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Camera
PRODUCT_PACKAGES += \
    libqomx_core \
    camera.device@3.2-impl \
    libmmcamera_interface \
    libmmjpeg_interface \
    android.hardware.camera.provider@2.4-impl \
    camera.hammerhead \
    mm-jpeg-interface-test \
    mm-qcamera-app \
    Snap

PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/external_camera_config.xml:system/vendor/etc/external_camera_config.xml

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    keystore.msm8974

# GPS configuration
PRODUCT_COPY_FILES += \
    device/lge/hammerhead/configs/gps.conf:system/etc/gps.conf

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    libgps.utils \
    gps.msm8974

# NFC packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl-bcm \
    android.hardware.nfc@1.0-service \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.1-service.hh

PRODUCT_PACKAGES += \
    libion

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.hh

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# USB HAL service
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Filesystem management tools
PRODUCT_PACKAGES += \
    resize2fs_static \
    e2fsck

PRODUCT_PACKAGES += \
    bdAddrLoader

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# broadcom wifi firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

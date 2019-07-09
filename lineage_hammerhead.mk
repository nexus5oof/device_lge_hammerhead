# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit basic aosp junk
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device vendor
$(call inherit-product-if-exists, vendor/lge/hammerhead/hammerhead-vendor.mk)

# Inherit device configuration
$(call inherit-product, device/lge/hammerhead/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hammerhead
PRODUCT_NAME := lineage_hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    PRIVATE_BUILD_DESC="taimen-user 9 PQ3A.190705.001 5565753 release-keys"

BUILD_FINGERPRINT := google/taimen/taimen:9/PQ3A.190705.001/5565753:user/release-keys

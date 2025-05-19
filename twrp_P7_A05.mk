#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit from P7_A05 device
$(call inherit-product, device/pritom/P7_A05/device.mk)

PRODUCT_DEVICE := P7_A05
PRODUCT_NAME := omni_P7_A05
PRODUCT_BRAND := PRITOM
PRODUCT_MODEL := P7
PRODUCT_MANUFACTURER := pritom

PRODUCT_GMS_CLIENTID_BASE := android-allwinner

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="P7_A05-user 13 TQ2A.230405.003.B2 20240507-183422 release-keys"

BUILD_FINGERPRINT := PRITOM/P7_A05/P7_A05:13/TQ2A.230405.003.B2/20240507-183422:user/release-keys

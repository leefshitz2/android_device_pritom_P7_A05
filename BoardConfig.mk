#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/pritom/P7_A05

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vendor \
    system \
    system_dlkm \
    vendor_dlkm \
    product
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := generic

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := exdroid
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 160
BOARD_HAS_FLIPPED_SCREEN := true

# Kernel
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_RAMDISK_USE_LZ4 := true
TARGET_KERNEL_CONFIG := adt3_defconfig
TARGET_KERNEL_SOURCE := kernel/askey/adt3
BOARD_KERNEL_IMAGE_NAME := Image.lz4

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# DTB
ifndef BOARD_PREBUILT_DTBOIMAGE
BOARD_KERNEL_SEPARATED_DTBO := true
endif
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
ifndef TARGET_PREBUILT_DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
else
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
endif

#My 1 TEST 
BOARD_VENDOR_CMDLINE := loop.max_part=4 mmcblk.perdev_minors=16 firmware_class.path=/vendor/etc/firmware bootconfig
BOARD_KERNEL_BASE := 0x40078000
BOARD_PAGE_SIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x03588000
BOARD_TAGS_OFFSET := 0xfff88100
BOARD_BOOT_HEADER_VERSION := 4
BOARD_HEADER_SIZE := 2128
BOARD_DTB_SIZE := 176221
BOARD_DTB_OFFSET := 0x03288000

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := pritom_dynamic_partitions
BOARD_PRITOM_DYNAMIC_PARTITIONS_PARTITION_LIST := system system system_dlkm vendor vendor_dlkm product
BOARD_PRITOM_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := saturn

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := ARGB_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3


# TWRP Configuration
TW_ROTATION := 180
TARGET_SCREEN_DENSITY := 160 
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_SCREEN_WIDTH := 640
TW_SCREEN_HEIGHT := 1024
TW_OVERRIDE_SYSTEM_PROPS := "ro.sf.lcd_density=200"
TW_HAS_NO_RECOVERY_PARTITION := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_USB_STORAGE := true
TW_EXCLUDE_MTP := true
TW_NO_EXFAT := true
TW_INCLUDE_FB2PNG := false
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_NANO := true
TW_INCLUDE_DUMLOCK := false
TW_NO_BATT_PERCENT := true
TW_NO_CPU_TEMP := true
TW_INCLUDE_INJECTTWRP := false
TW_HAS_DOWNLOAD_MODE := false
TW_NO_HAPTICS := true
TW_INCLUDE_NTFS_3G := false
TW_EXCLUDE_TWRPAPP := true
TW_NO_LEGACY_PROPS := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := false
TWRP_INCLUDE_LOGCAT := false
TW_OEM_BUILD := true
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true

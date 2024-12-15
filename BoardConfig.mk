#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a34x

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
ALLOW_MISSING_DEPENDENCIES=true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Boot Image
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board ""

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := a34x
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 loop.max_part=7 androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
TARGET_KERNEL_CONFIG := a34x_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a34x

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_DTBOIMG_PARTITION_SIZE := 730224
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system_ext \
    vendor \
    odm \
    system \
    product
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
-include vendor/lineage/config/BoardConfigReservedSize.mk
 
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm

#BOARD_BUILD_VENDORIMAGE := false
#BUILD_WITHOUT_VENDOR := true

# Platform
TARGET_BOARD_PLATFORM := mt6877
BOARD_HAS_MTK_HARDWARE := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
#TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
#TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
#TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
#TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.emmc
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2024-07-01

# SELinux
#include device/mediatek/sepolicy_vndr/SEPolicy.mk
SELINUX_IGNORE_NEVERALLOWS := true
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# VNDK
BOARD_VNDK_VERSION := 31

# VINTF
#DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/framework_compatibility_matrix.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/configs/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.cas@1.2-service-lazy.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.dumpstate@1.1-service-lazy.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.health@2.1-samsung.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.neuralnetworks@1.3-service-mtk-mdla-dsp-gpu.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.sensors@2.0-multihal.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.usb@1.3-service.coral.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.wifi@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.wifi.hostapd.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/android.hardware.wifi.supplicant.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/deviceManifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/engmode_manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/face-default-sec.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/hyper-default-sec.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/lights-default-sec.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/manifest_android.hardware.drm@1.4-service.clearkey.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/manifest_android.hardware.drm@1.4-service.widevine.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/manifest_hwcomposer.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/output.txt
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/power-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/sec.android.hardware.nfc@1.2-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/sec_c2_manifest_default0_1_2.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vaultkeeper_manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.authfw@1.0-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.biometrics.fingerprint@3.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.radio.exclude.mediatek.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.radio.exclude_ship.mediatek.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.radio_manifest_2_30.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.security.fkeymaster-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.security.hdcp.wifidisplay-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.security.widevine.keyprov-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.security.wsm.service-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.sehradio_manifest_2_30.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.snap-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.thermal@1.0-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.tlc.hdm@1.1-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.tlc.iccc@1.0-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.tlc.kg@1.1-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.tlc.mpos_tui@1.0-manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.vibrator-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.wifi@2.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/vendor.samsung.hardware.wifi.hostapd.xml


# Inherit the proprietary files
include vendor/samsung/a34x/BoardConfigVendor.mk

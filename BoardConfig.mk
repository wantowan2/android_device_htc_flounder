#
# Copyright (C) 2013-2014 The Android Open-Source Project
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

# start of image reserved address space
LIBART_IMG_HOST_BASE_ADDRESS   := 0x60000000
LIBART_IMG_TARGET_BASE_ADDRESS := 0x70000000

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := denver64
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := denver
ARCH_ARM_HAVE_NEON := true

TARGET_KERNEL_SOURCE := kernel/htc/flounder-kernel

HAS_PREBUILT_KERNEL := true
BOARD_KERNEL_IMAGE_NAME := kernel/htc/flounder-kernel/Image.gz-dtb

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false

TARGET_NO_BOOTLOADER := true

TARGET_NO_RADIOIMAGE := true

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false

TARGET_BOARD_PLATFORM := tegra132
TARGET_BOARD_INFO_FILE := device/htc/flounder/board-info.txt

TARGET_BOOTLOADER_BOARD_NAME := flounder

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2782920704
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 13287555072
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456

BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_USES_GENERIC_INVENSENSE := false

# RenderScript
# OVERRIDE_RS_DRIVER := libnvRSDriver.so
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a15
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a57
# DISABLE_RS_64_BIT_DRIVER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/flounder/bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

TARGET_CAMERA_USE_NOKIA_STORE := false
TARGET_CAMERA_HAS_FLASH := true

BOARD_VENDOR_USE_SENSOR_HAL := sensor_hub
BOARD_HAL_STATIC_LIBRARIES := libdumpstate.flounder libhealthd.flounder

# let charger mode enter suspend
BOARD_CHARGER_ENABLE_SUSPEND := true


# GPS related defines
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
TARGET_NO_RPC := true
BOARD_USES_QCOM_HARDWARE_GPS := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

TARGET_USES_64_BIT_BCMDHD := true
TARGET_USES_64_BIT_BINDER := true

TARGET_USES_LOGD := true
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# HACK: Build apps as 64b for volantis_64_only
ifneq (,$(filter ro.zygote=zygote64, $(PRODUCT_DEFAULT_PROPERTY_OVERRIDES)))
TARGET_PREFER_32_BIT_APPS :=
TARGET_SUPPORTS_32_BIT_APPS :=
TARGET_SUPPORTS_64_BIT_APPS := true
endif

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/flounder

ART_USE_HSPACE_COMPACT=true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

MALLOC_IMPL := dlmalloc

# Use the non-open-source parts, if they're present
-include vendor/du/config/common.mk
-include vendor/du/config/common.mkcommon_full_tablet_wifionly.mk

# Build a separate vendor.img
# Use the non-open-source parts, if they're present
#-include vendor/htc/flounder/device-flounder.mk
#include vendor/htc/flounder/device-flounder.mk
# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

# Assert
TARGET_BOARD_INFO_FILE ?= device/htc/flounder/board-info.txt
TARGET_OTA_ASSERT_DEVICE := flounder,volantis



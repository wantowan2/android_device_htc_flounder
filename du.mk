# Copyright (C) 2014 Teamdu
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

$(call inherit-product, $(LOCAL_PATH)/product.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_PROPERTY_OVERRIDES += \
        net.dns1=8.8.8.8 \
        net.dns2=8.8.4.4

PRODUCT_NAME := du_flounder
PRODUCT_DEVICE := flounder
PRODUCT_BRAND := Android
PRODUCT_MODEL := DU on Flounder
PRODUCT_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, $(LOCAL_PATH)/flounder64/BoardConfig.mk)

# Inherit some common du stuff.
$(call inherit-product, vendor/du/config/common.mk)
$(call inherit-product, vendor/du/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/du/config/nfc_enhanced.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
vendor/du/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip


# Copyright (C) 2013 The Android Open Source Project
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
# And Ed's because he wants it that way, hmmp....

PRODUCT_RUNTIMES := runtime_libart_default

$(call inherit-product, $(SRC_TARGET_DIR)/art/build/Android.common_build.mk)

PRELOADED_CLASSES := frameworks/base/preloaded-classes

# start of image reserved address space
LIBART_IMG_HOST_BASE_ADDRESS   := 0x60000000
LIBART_IMG_TARGET_BASE_ADDRESS := 0x70000000

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only


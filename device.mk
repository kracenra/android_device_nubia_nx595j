#
# Copyright (C) 2017 The MoKee Open Source Project
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
# Inherit from msm8998-common
$(call inherit-product, device/nubia/msm8998-common/msm8998.mk)

$(call inherit-product, vendor/nubia/nx595j/nx595j-vendor.mk)

# Local overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-mokee

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2018-03-05

# Lights
PRODUCT_PACKAGES += \
   android.hardware.light@2.0-service.nx595j

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/clean_finger.sh:$(TARGET_COPY_OUT_VENDOR)/bin/clean_finger.sh \
    $(LOCAL_PATH)/rootdir/clean_finger.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/clean_finger.rc \

# Ifaa
PRODUCT_PACKAGES += \
    NBIFAAService \
    ifaa_fingerprint

PRODUCT_BOOT_JARS += \
    ifaa_fingerprint

# Fingerprint service
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Properties
include $(LOCAL_PATH)/vendor_prop.mk

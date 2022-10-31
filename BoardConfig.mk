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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from msm8998-common
include device/nubia/msm8998-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := nx595j,NX595J

DEVICE_PATH := device/nubia/nx595j

# Kernel
TARGET_KERNEL_CONFIG := nx595j_defconfig

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab.recovery.qcom


# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# inherit from the proprietary version
-include vendor/nubia/nx595j/BoardConfigVendor.mk


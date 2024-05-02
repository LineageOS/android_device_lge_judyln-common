#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_COMMON_PATH := device/lge/judyln-common
DEVICE_NAME := judyln

# common judy (sdm845)
$(call inherit-product, device/lge/sdm845-common/sdm845.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_COMMON_PATH)/overlay \
    $(DEVICE_COMMON_PATH)/overlay-lineage

# Properties
TARGET_VENDOR_PROP += $(DEVICE_COMMON_PATH)/vendor.prop

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_COMMON_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_COMMON_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_COMMON_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_COMMON_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(DEVICE_COMMON_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(DEVICE_COMMON_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(DEVICE_COMMON_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

PRODUCT_SOONG_NAMESPACES += \
	$(DEVICE_COMMON_PATH)

# Wi-Fi Overlay
PRODUCT_PACKAGES += \
    WifiOverlayG7

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/judyln-common/judyln-common-vendor.mk)

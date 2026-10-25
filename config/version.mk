# Copyright (C) 2024 Project Infinity X
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

ANDROID_VERSION := 17
INFINITYVERSION := 4.1

PRODUCT_VERSION_MAJOR = 24
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0

INFINITY_BUILD_TYPE ?= RELEASE
INFINITY_MAINTAINER ?= Wanderer
LINEAGE_BUILDTYPE ?= $(INFINITY_BUILD_TYPE)

INFINITY_DATE_YEAR := $(shell date -u +%Y)
INFINITY_DATE_MONTH := $(shell date -u +%m)
INFINITY_DATE_DAY := $(shell date -u +%d)
INFINITY_BUILD_DATE := $(INFINITY_DATE_DAY).$(INFINITY_DATE_MONTH).$(INFINITY_DATE_YEAR)
LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d)

TARGET_PRODUCT_SHORT := $(subst infinity_,,$(INFINITY_BUILD))
ifeq ($(TARGET_PRODUCT_SHORT),)
TARGET_PRODUCT_SHORT := $(PRODUCT_DEVICE)
endif

ifeq ($(WITH_GAPPS), true)
INFINITY_VARIANT := GAPPS
else
INFINITY_VARIANT := VANILLA
endif

# LineageOS Formatting applied to Project Infinity-X
LINEAGE_VERSION := $(INFINITYVERSION)-$(LINEAGE_BUILD_DATE)-$(INFINITY_BUILD_TYPE)-$(INFINITY_VARIANT)-$(TARGET_PRODUCT_SHORT)
ZIP_NAME := Project_Infinity-X-$(INFINITYVERSION)-$(LINEAGE_BUILD_DATE)-$(INFINITY_BUILD_TYPE)-$(INFINITY_VARIANT)-$(TARGET_PRODUCT_SHORT)

INFINITY_VERSION := Project_Infinity-X-$(INFINITYVERSION)-$(INFINITY_BUILD)-$(INFINITY_BUILD_DATE)
INFINITY_DISPLAY_VERSION := Project_Infinity-X-$(INFINITYVERSION)-$(INFINITY_BUILD_TYPE)
INFINITY_DISPLAY_BUILDTYPE := $(INFINITY_BUILD_TYPE)
INFINITY_FINGERPRINT := Project_Infinity/$(INFINITY_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(INFINITY_BUILD_DATE)

# LineageOS System Version & Updater Properties (compatible with LineageOS Updater)
PRODUCT_PRODUCT_PROPERTIES += \
  ro.lineage.version=$(LINEAGE_VERSION) \
  ro.lineage.releasetype=$(LINEAGE_BUILDTYPE) \
  ro.lineage.build.version=$(INFINITYVERSION) \
  ro.lineage.device=$(TARGET_PRODUCT_SHORT)

# INFINITY System Version
PRODUCT_PRODUCT_PROPERTIES += \
  ro.infinity.aversion=$(ANDROID_VERSION) \
  ro.infinity.android.version=$(ANDROID_VERSION) \
  ro.infinity.build.version=$(INFINITY_VERSION) \
  ro.infinity.build.status=$(INFINITY_BUILD_TYPE) \
  ro.modversion=$(INFINITY_VERSION) \
  ro.infinity.build.date=$(INFINITY_BUILD_DATE) \
  ro.infinity.buildtype=$(INFINITY_BUILD_TYPE) \
  ro.infinity.fingerprint=$(INFINITY_FINGERPRINT) \
  ro.infinity.device=$(INFINITY_BUILD) \
  ro.infinity.version=$(INFINITYVERSION) \
  ro.infinity.maintainer=$(INFINITY_MAINTAINER)

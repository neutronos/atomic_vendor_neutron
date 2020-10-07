# Copyright (C) 2018 The NEUTRONOS Project
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

NEUTRON_MOD_VERSION = v2.0

ifndef NEUTRON_BUILD_TYPE
NEUTRON_BUILD_TYPE := BETA

endif

#ifeq ($(NEUTRON_BUILD_TYPE), OFFICIAL)

#PRODUCT_PACKAGES += \
#    Updater

#endif

TARGET_PRODUCT_SHORT := $(subst NEUTRONos_,,$(NEUTRON_BUILD))

# Gapps
#ifeq ($(BUILD_WITH_GAPPS),true)
#IS_PHONE := true
#include vendor/gapps/config.mk

#NEUTRON_EDITION := GAPPS
#NEUTRON_BUILD_DATETIME := $(shell date +%s)
#NEUTRON_BUILD_DATE := $(shell date -d @$(NEUTRON_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
#NEUTRON_VERSION := NEUTRONOS-$(NEUTRON_MOD_VERSION)-$(NEUTRON_EDITION)-$(NEUTRON_BUILD)-$(NEUTRON_BUILD_TYPE)-$(NEUTRON_BUILD_DATE)
#NEUTRON_FINGERPRINT := NEUTRONOS/$(NEUTRON_MOD_VERSION)/$(NEUTRON_EDITION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(NEUTRON_BUILD_DATE)
#NEUTRON_DISPLAY_VERSION := NEUTRONOS-$(NEUTRON_MOD_VERSION)-$(NEUTRON_EDITION)-$(NEUTRON_BUILD_TYPE)-$(NEUTRON_BUILD_DATE)
#else
NEUTRON_EDITION := NORMAL
NEUTRON_BUILD_DATETIME := $(shell date +%s)
NEUTRON_BUILD_DATE := $(shell date -d @$(NEUTRON_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
NEUTRON_VERSION := NeutronOS-$(NEUTRON_MOD_VERSION)-$(NEUTRON_BUILD)-$(NEUTRON_BUILD_TYPE)-$(NEUTRON_BUILD_DATE)
NEUTRON_FINGERPRINT := NeutronOS/$(NEUTRON_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(NEUTRON_BUILD_DATE)
NEUTRON_DISPLAY_VERSION := NeutronOS-$(NEUTRON_MOD_VERSION)-$(NEUTRON_BUILD_TYPE)-$(NEUTRON_BUILD_DATE)

#endif

PRODUCT_GENERIC_PROPERTIES += \
  ro.neutron.version=$(NEUTRON_VERSION) \
  ro.neutron.releasetype=$(NEUTRON_BUILD_TYPE) \
  ro.modversion=$(NEUTRON_MOD_VERSION) \
  ro.neutron.build.date=$(NEUTRON_BUILD_DATETIME)\
  ro.neutron.display.version=$(NEUTRON_DISPLAY_VERSION) \
  ro.neutron.fingerprint=$(NEUTRON_FINGERPRINT)\
  ro.neutron.edition=$(NEUTRON_EDITION)

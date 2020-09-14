# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

ifndef NEUTRON_BUILDTYPE
NEUTRON_BUILDTYPE := UNOFFICIAL

endif

ifeq ($(NEUTRON_BUILDTYPE), OFFICIAL)

# NEUTRON System Version
PRODUCT_VERSION = 1.69

# Gapps
ifeq ($(BUILD_WITH_GAPPS),true)
IS_PHONE := true
include vendor/gapps/config.mk

NEUTRON_EDITION := GAPPS
NEUTRON_VERSION := NEUTRON-OS-$(PRODUCT_VERSION)-$(NEUTRON_EDITION)-$(shell date +%Y%m%d)-$(NEUTRON_BUILD)-$(NEUTRON_BUILDTYPE)
else
NEUTRON_EDITION := NORMAL
NEUTRON_VERSION := NEUTRON-OS-$(PRODUCT_VERSION)-$(NEUTRON_EDITION)-$(shell date +%Y%m%d)-$(NEUTRON_BUILD)-$(NEUTRON_BUILDTYPE)

endif

# NEUTRON System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.neutron.version=$(NEUTRON_VERSION) \
    ro.neutron.releasetype=$(NEUTRON_BUILDTYPE) \
    ro.neutron.build.version=$(PRODUCT_VERSION) \
    ro.modversion=$(NEUTRON_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal \
	neutron.ota.version= $(shell date +%Y%m%d) \
    ro.neutron.tag=$(shell grep "refs/tags" .repo/manifest.xml  | cut -d'"' -f2 | cut -d'/' -f3)

# NEUTRON Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.neutron.display.version=$(NEUTRON_VERSION)

# NEUTRON Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.neutron.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# NEUTRON Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.neutron.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

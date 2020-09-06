# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif


# NEUTRON System Version
PRODUCT_VERSION = 1.0
ifneq ($(NEUTRON_BUILDTYPE),)
NEUTRON_VERSION := NEUTRON-OS-$(PRODUCT_VERSION)-$(shell date +%Y%m%d)-$(NEUTRON_BUILD)-$(NEUTRON_BUILDTYPE)
else
NEUTRON_VERSION := NEUTRON-OS-$(PRODUCT_VERSION)-$(shell date +%Y%m%d)-$(NEUTRON_BUILD)-Unofficial
NEUTRON_BUILDTYPE=Unofficial
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

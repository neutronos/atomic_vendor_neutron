# Inherit common PixysOS stuff
$(call inherit-product, vendor/neutron/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder

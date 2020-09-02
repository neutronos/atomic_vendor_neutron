# Inherit full common neutron stuff
$(call inherit-product, vendor/neutron/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include neutron LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/neutron/overlay/dictionaries

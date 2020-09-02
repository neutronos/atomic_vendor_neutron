# Inherit full common Lineage stuff
$(call inherit-product, vendor/neutron/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/neutron/overlay/dictionaries

$(call inherit-product, vendor/neutron/config/telephony.mk)

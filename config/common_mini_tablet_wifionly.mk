# Inherit mini common Lineage stuff
$(call inherit-product, vendor/neutron/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

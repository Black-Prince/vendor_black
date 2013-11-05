# GSM APN list
PRODUCT_COPY_FILES += \
    vendor/black/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.XML

# GSM SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/black/prebuilt/etc/spn-conf.xml:system/etc/spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

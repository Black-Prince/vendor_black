PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# superuser
SUPERUSER_EMBEDDED := true

PRODUCT_BRAND ?= black

# properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    persist.sys.root_access=1

# bootanimation
PRODUCT_COPY_FILES += \
	vendor/black/bootanimation.zip:system/media/bootanimation.zip

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/black/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/black/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/black/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/black/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
	vendor/black/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
	vendor/black/prebuilt/bin/sysinit:system/bin/sysinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
   vendor/black/prebuilt/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# userinit support
PRODUCT_COPY_FILES += \
    vendor/black/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with black extras
PRODUCT_COPY_FILES += \
    vendor/black/prebuilt/etc/init.local.rc:root/init.black.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/black/config/packages.mk

# Versioning
-include vendor/black/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/black/overlay/common

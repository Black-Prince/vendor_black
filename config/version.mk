# version
RELEASE = false
BLACKSROM_VERSION_MAJOR = 1
BLACKSROM_VERSION_MINOR = 0

ifeq ($(RELEASE),true)
    BLACKSROM_VERSION_STATE := OFFICIAL
    BLACKSROM_VERSION := BlackSRom-KITKAT-v$(BLACKSROM_VERSION_MAJOR).$(BLACKSROM_VERSION_MINOR)-$(BLACKSROM_VERSION_STATE)
else
    BLACKSROM_VERSION_STATE := HOMEMADE
    BLACKSROM_VERSION := BlackSRom-KITKAT-v$(BLACKSROM_VERSION_MAJOR).$(BLACKSROM_VERSION_MINOR)-$(BLACKSROM_VERSION_STATE)
endif

ifeq ($(RELEASE),true)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=blacksromKITKAT \
        ro.goo.developerid= blacksrom \
        ro.goo.version=$(shell date +%Y%m%d)
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=blacksromKITKAThomemade \
        ro.goo.developerid= blacksrom \
        ro.goo.version=$(shell date +%Y%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.blacksrom.version=$(BLACKSROM_VERSION)

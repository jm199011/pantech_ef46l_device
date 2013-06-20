$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/pantech/ef46l/ef46l-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/pantech/ef46l/overlay

LOCAL_PATH := device/pantech/ef46l
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_ef46l
PRODUCT_DEVICE := ef46l

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/pantech/ef46l/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef46l/ramdisk/init.target.rc:root/init.target.rc \
    device/pantech/ef46l/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/pantech/ef46l/ramdisk/init.pantech.usb.rc:root/init.pantech.usb.rc \
    device/pantech/ef46l/ramdisk/ueventd.rc:root/ueventd.rc \
    device/pantech/ef46l/ramdisk/initlogo.rle:root/initlogo.rle

THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
FINALPACKAGE = 1
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SSLKillSwitch2
SSLKillSwitch2_FILES = SSLKillSwitch/SSLKillSwitch.m

SSLKillSwitch2_FRAMEWORKS = Security

# Build as a Substrate Tweak
SSLKillSwitch2_CFLAGS=-DSUBSTRATE_BUILD

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk


after-install::
	# Respring the device
	install.exec "killall -9 SpringBoard"

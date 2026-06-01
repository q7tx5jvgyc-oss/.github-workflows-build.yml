export THEOS_DEVICE_IP = localhost
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MoustacheClicker
MoustacheClicker_FILES = Tweak.x
MoustacheClicker_FRAMEWORKS = UIKit CoreGraphics Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

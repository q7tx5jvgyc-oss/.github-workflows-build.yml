ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MoustacheClicker
MoustacheClicker_FILES = main.mm
MoustacheClicker_FRAMEWORKS = UIKit IOKit

include $(THEOS_MAKE_PATH)/tweak.mk

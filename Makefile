# إعدادات المعمارية للآيفون (arm64 هو المعيار الحالي)
ARCHS = arm64
include $(THEOS)/makefiles/common.mk

# اسم مشروعك (لا تضع مسافات)
TWEAK_NAME = MoustacheClicker

# هنا تضع اسم ملف الكود الخاص بك (إذا سميته main.mm ضع main.mm هنا)
MoustacheClicker_FILES = main.mm

# المكتبات البرمجية التي يحتاجها كودك ليعمل (UIKit ضروري جداً للواجهة)
MoustacheClicker_FRAMEWORKS = UIKit CoreGraphics Foundation

# مسار التثبيت (لا تغير هذا)
include $(THEOS_MAKE_PATH)/tweak.mk

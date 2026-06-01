# إعدادات المعمارية - arm64 هو المعيار لأجهزة الآيفون الحديثة
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

# استيراد إعدادات Theos الأساسية
include $(THEOS)/makefiles/common.mk

# اسم الأداة (يجب أن يكون مطابقاً لاسم مجلد المشروع إن وجد)
TWEAK_NAME = MoustacheClicker

# تحديد ملف الكود البرمجي (لقد قمنا بتغييره لـ main.mm كما أخبرتني)
MoustacheClicker_FILES = main.mm

# تحديد المكتبات التي يعتمد عليها كودك
MoustacheClicker_FRAMEWORKS = UIKit CoreGraphics Foundation

# المسار النهائي للبناء
include $(THEOS_MAKE_PATH)/tweak.mk

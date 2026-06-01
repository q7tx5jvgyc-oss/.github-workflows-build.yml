#import <UIKit/UIKit.h>
#import <IOKit/IOKitLib.h>

// تعريف دوال الـ IOHID للتحكم باللمس
extern void IOHIDEventSystemClientDispatchEvent(void* client, void* event);
extern void* IOHIDEventCreateDigitizerFingerEvent(void* a, unsigned int b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, unsigned int j, unsigned int k, unsigned int l, unsigned int m, unsigned int n, unsigned int o);

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    // تأخير بسيط لبدء النقرات بعد تشغيل الجهاز
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // إحداثيات الضغط (غيرها حسب مكان الزر في اللعبة)
        CGPoint point = CGPointMake(500, 500); 
        
        // دالة لمحاكاة الضغط
        void* event = IOHIDEventCreateDigitizerFingerEvent(kCFAllocatorDefault, 0, 1, 1, 3, 0, 0, point.x, point.y, 0, 0, 0, 0, 0, 0);
        IOHIDEventSystemClientDispatchEvent(NULL, event);
        
        NSLog(@"Moustache: Auto Click Performed!");
    });
}
%end

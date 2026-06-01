#import <UIKit/UIKit.h>
#import <IOKit/IOKitLib.h>

// دوال التحكم باللمس
void simulateTap(CGPoint point) {
    // كود إرسال حدث اللمس للنظام (IOHIDEvent)
    // يتطلب مهارة عالية في ربط الأحداث
}

// إنشاء "هدف" (Target) قابل للتحريك
@interface DragView : UIView
@end

@implementation DragView {
    CGPoint lastLocation;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    lastLocation = [[touches anyObject] locationInView:self.superview];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint newPoint = [[touches anyObject] locationInView:self.superview];
    self.center = CGPointMake(self.center.x + (newPoint.x - lastLocation.x), 
                              self.center.y + (newPoint.y - lastLocation.y));
    lastLocation = newPoint;
}
@end
UIWindow *menuWindow;
UISlider *speedSlider;
BOOL isRunning = NO;

// إنشاء نافذة القائمة
void showMenu() {
    menuWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, 100, 200, 250)];
    menuWindow.backgroundColor = [UIColor blackColor];
    menuWindow.layer.cornerRadius = 10;
    
    // شريط السرعة
    speedSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 50, 180, 30)];
    speedSlider.minimumValue = 0.1;
    speedSlider.maximumValue = 2.0;
    [menuWindow addSubview:speedSlider];
    
    // زر البدء
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setTitle:@"Start Clicker" forState:UIControlStateNormal];
    startBtn.frame = CGRectMake(10, 100, 180, 40);
    [menuWindow addSubview:startBtn];
    
    [menuWindow makeKeyAndVisible];
}

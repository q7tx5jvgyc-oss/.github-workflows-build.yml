#import <UIKit/UIKit.h>

@interface DragButton : UIButton
@end

@implementation DragButton
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.superview];
    self.center = location;
}
@end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        win.windowLevel = UIWindowLevelAlert + 1;
        win.hidden = NO;
        win.backgroundColor = [UIColor clearColor];

        DragButton *btn = [DragButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(100, 100, 60, 60);
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"Auto" forState:UIControlStateNormal];
        [win addSubview:btn];
    });
}
%end

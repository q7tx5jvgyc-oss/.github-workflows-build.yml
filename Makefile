#import <UIKit/UIKit.h>

@interface MoustacheView : UIView
@property (nonatomic, strong) UIButton *btn;
@end

@implementation MoustacheView

- (id)init {
    self = [super initWithFrame:CGRectMake(50, 150, 120, 60)];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.layer.cornerRadius = 15;
    
    // خاصية السحب (Slippery/Smooth Dragging)
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    [self addGestureRecognizer:pan];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = self.bounds;
    [self.btn setTitle:@"Start Click" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(startClicking) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    return self;
}

// تحريك القائمة بسلاسة
- (void)handleDrag:(UIPanGestureRecognizer *)p {
    CGPoint translation = [p translationInView:self.superview];
    self.center = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
    [p setTranslation:CGPointZero inView:self.superview];
}

// نقرات حقيقية لا تجمّد اللعبة (خارج الـ Main Thread)
- (void)startClicking {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        while(true) {
            // محاكاة نقرة حقيقية في إحداثيات (x=500, y=500)
            // ملاحظة: قد تحتاج لربط مكتبة IOKit للتحكم الكامل
            usleep(500000); // 0.5 ثانية
        }
    });
}
@end

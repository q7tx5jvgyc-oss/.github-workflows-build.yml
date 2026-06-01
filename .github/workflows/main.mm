#import <UIKit/UIKit.h>

@interface MoustacheView : UIView
@property (nonatomic, strong) UIButton *btn;
@end

@implementation MoustacheView

- (id)init {
    self = [super initWithFrame:CGRectMake(50, 150, 120, 60)];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    self.layer.cornerRadius = 15;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    [self addGestureRecognizer:pan];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = self.bounds;
    [self.btn setTitle:@"Moustache" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(startClicking) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    return self;
}

- (void)handleDrag:(UIPanGestureRecognizer *)p {
    CGPoint translation = [p translationInView:self.superview];
    self.center = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
    [p setTranslation:CGPointZero inView:self.superview];
}

- (void)startClicking {
    NSLog(@"Moustache Clicker: Started");
}

@end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        MoustacheView *view = [[MoustacheView alloc] init];
        [window addSubview:view];
    });
}
%end

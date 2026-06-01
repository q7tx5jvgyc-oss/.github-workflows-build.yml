#import <UIKit/UIKit.h>

// تعريف الكلاس الخاص بالقائمة العائمة
@interface MoustacheView : UIView
@property (nonatomic, strong) UIButton *btn;
@end

@implementation MoustacheView

- (id)init {
    self = [super initWithFrame:CGRectMake(100, 100, 120, 60)];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    self.layer.cornerRadius = 10;
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = self.bounds;
    [self.btn setTitle:@"Moustache Click" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(startClicking) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    
    return self;
}

- (void)startClicking {
    // كود النقر التلقائي
    NSLog(@"Moustache Clicker: Starting...");
    // يمكنك إضافة منطق النقر هنا
}
@end

// حقن الأداة عند بدء تشغيل التطبيق (Entry Point)
__attribute__((constructor)) static void init() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        MoustacheView *view = [[MoustacheView alloc] init];
        [window addSubview:view];
    });
}

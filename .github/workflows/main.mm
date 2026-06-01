#import <Foundation/Foundation.h>

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    NSLog(@"Moustache: Tweak Loaded Successfully!");
}
%end

#import <Foundation/Foundation.h>
#import "WindowTintColor.h"

@implementation WindowTintColor

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setTintColor:(NSString *)hexString)
{
    UIColor *color = [self colorFromHexString: hexString];
    DispatchQueue.main.async {
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        if (keyWindow) {
            [keyWindow setTintColor: color];
        }
    }
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end

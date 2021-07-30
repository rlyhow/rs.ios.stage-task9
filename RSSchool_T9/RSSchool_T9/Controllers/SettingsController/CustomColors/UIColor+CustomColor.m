//
//  UIColor+CustomColor.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 30.07.21.
//

#import "UIColor+CustomColor.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation UIColor (CustomColor)

+(UIColor*)color1{
    return UIColorFromRGB(0xbe2813);
}
+(UIColor*)color2{
    return UIColorFromRGB(0x3802da);
}
+(UIColor*)color3 {
    return UIColorFromRGB(0x467c24);
}
+(UIColor*)color4 {
    return UIColorFromRGB(0x808080);
}
+(UIColor*)color5 {
    return UIColorFromRGB(0x8e5af7);
}
+(UIColor*)color6 {
    return UIColorFromRGB(0xf07f5a);
}
+(UIColor*)color7 {
    return UIColorFromRGB(0xf3af22);
}
+(UIColor*)color8 {
    return UIColorFromRGB(0x3dacf7);
}
+(UIColor*)color9 {
    return UIColorFromRGB(0xe87aa4);
}
+(UIColor*)color10 {
    return UIColorFromRGB(0x0f2e3f);
}
+(UIColor*)color11 {
    return UIColorFromRGB(0x213711);
}
+(UIColor*)color12 {
    return UIColorFromRGB(0x511307);
}
+(UIColor*)color13 {
    return UIColorFromRGB(0x92003b);
}

@end

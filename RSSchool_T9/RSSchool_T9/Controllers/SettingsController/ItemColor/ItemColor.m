//
//  ItemColor.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 30.07.21.
//

#import "ItemColor.h"

@implementation ItemColor

- (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color {
    self = [super init];
    if (self) {
        _title = title;
        _color = color;
    }
    return self;
}

@end

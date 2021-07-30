//
//  ItemColor.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 30.07.21.
//

#import <Foundation/Foundation.h>
#import "UIColor+CustomColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemColor : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithTitle:(NSString *)title andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

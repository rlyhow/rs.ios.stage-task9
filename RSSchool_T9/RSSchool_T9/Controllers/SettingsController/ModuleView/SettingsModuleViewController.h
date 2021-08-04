//
//  SettingsModuleViewController.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import <UIKit/UIKit.h>
#import "ColorsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol getColorAndSwitch
- (void)setSwitch:(BOOL)switchInfo andColor:(UIColor *)color;
@end

@interface SettingsModuleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) ColorsViewController *colorVC;
@property (weak, nonatomic) id<getColorAndSwitch> delegate;

@end

NS_ASSUME_NONNULL_END

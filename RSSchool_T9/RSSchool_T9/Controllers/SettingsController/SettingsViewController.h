//
//  SettingsViewController.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import <UIKit/UIKit.h>
#import "SettingsModuleViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol sendParam
// объявляем метод делегата
- (void)stateSwitch:(BOOL)switchInfo colorInfo:(UIColor *)color;
@end

@interface SettingsViewController : UINavigationController

@property(strong, nonatomic) SettingsModuleViewController *moduleVC;
@property (weak, nonatomic) id<sendParam> delegateM;

@end

NS_ASSUME_NONNULL_END

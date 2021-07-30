//
//  SettingsViewController.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import <UIKit/UIKit.h>
#import "SettingsModuleViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UINavigationController

@property(strong, nonatomic) SettingsModuleViewController *moduleVC;

@end

NS_ASSUME_NONNULL_END

//
//  SettingsModuleViewController.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import <UIKit/UIKit.h>
#import "ColorsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsModuleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) ColorsViewController *colorVC;

@end

NS_ASSUME_NONNULL_END

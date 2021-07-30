//
//  SettingsViewController.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.moduleVC = [SettingsModuleViewController new];
    self.viewControllers = @[self.moduleVC];
}

@end

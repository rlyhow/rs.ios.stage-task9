//
//  SettingsViewController.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <getColorAndSwitch>
@property (nonatomic) BOOL switchState;
@property (nonatomic, strong) UIColor *textColor;
@end

@implementation SettingsViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.moduleVC = [SettingsModuleViewController new];
    self.viewControllers = @[self.moduleVC];
    self.moduleVC.delegate = self;
}

- (void)setSwitch:(BOOL)switchInfo andColor:(UIColor *)color {
    self.switchState = switchInfo;
    self.textColor = color;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:NO];
    
    [self.delegateM stateSwitch:self.switchState colorInfo:self.textColor];
}


@end

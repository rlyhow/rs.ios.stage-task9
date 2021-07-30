//
//  SettingsModuleViewController.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import "SettingsModuleViewController.h"
#import "UIColor+CustomColor.h"

@interface SettingsModuleViewController () <SelectRow>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *dataSource;
@property (nonatomic, strong) NSIndexPath *defaultRow;

@end

@implementation SettingsModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"Draw stories", @"Stroke color", nil];
    
    [self setupTableView];
    self.defaultRow = [NSIndexPath indexPathForRow:8 inSection:0];
}

- (void)setupNavigationBar {
    self.navigationItem.title = @"Settings";
    
    UIBarButtonItem *backButton = [UIBarButtonItem alloc];
    
    backButton = [backButton initWithTitle:@"Settings"
                        style:UIBarButtonItemStyleDone
                       target:self
                       action:@selector(pushBack)
     ];
    
    [backButton setTitleTextAttributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:17.0]} forState:UIControlStateNormal];
    [backButton setTitleTextAttributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:17.0]} forState:UIControlStateHighlighted];
    
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)push {
    self.colorVC = [ColorsViewController new];
    self.colorVC.delegate = self;
    
    [self.navigationController pushViewController:self.colorVC animated:YES];
}

- (void)pushBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSIndexPath *)getDefaultRowIndex {
    return self.defaultRow;
}

- (void)setDefaultRowIndex:(NSIndexPath *)row {
    self.defaultRow = row;
    
}

- (void)setDetailedText:(NSString *)detailedText andColor:(UIColor *)color {
    [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]].detailTextLabel.text = detailedText;
    [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]].detailTextLabel.textColor = color;
}


- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStyleInsetGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
        
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];

    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchView setOn:YES animated:NO];

    switch ([indexPath row])
        {
            case 0:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
                cell.accessoryView = switchView;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            case 1:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
                [[cell detailTextLabel] setText:@"#e87aa4"];
                [cell detailTextLabel].textColor = [UIColor color9];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            default:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
                break;
        }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([indexPath row] == 1) {
        [self push];
    }
}

@end

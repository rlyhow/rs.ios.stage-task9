//
//  ColorsViewController.m
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import "ColorsViewController.h"
#import "UIColor+CustomColor.h"
#import "ItemColor.h"
#import "SettingsModuleViewController.h"

@interface ColorsViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<ItemColor *> *dataSource;
@property (nonatomic) NSIndexPath *selectedRow;

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillInitialDataSource];

    [self setupTableView];
    self.tableView.tintColor =  [UIColor redColor];
    
    self.selectedRow = [self.delegate getDefaultRowIndex];
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
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    
    cell.textLabel.text = self.dataSource[indexPath.row].title;
    cell.textLabel.textColor = self.dataSource[indexPath.row].color;

    if (indexPath == self.selectedRow) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.tableView cellForRowAtIndexPath:self.selectedRow].accessoryType = UITableViewCellAccessoryNone;
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    self.selectedRow = indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate setDefaultRowIndex:self.selectedRow];
    [self.delegate setDetailedText:[self.tableView cellForRowAtIndexPath:indexPath].textLabel.text andColor:[self.tableView cellForRowAtIndexPath:indexPath].textLabel.textColor];
}

- (void)fillInitialDataSource {
    self.dataSource = [NSMutableArray arrayWithArray:@[
        [[ItemColor alloc] initWithTitle:@"#be2813" andColor:[UIColor color1]],
        [[ItemColor alloc] initWithTitle:@"#3802da" andColor:[UIColor color2]],
        [[ItemColor alloc] initWithTitle:@"#467c24" andColor:[UIColor color3]],
        [[ItemColor alloc] initWithTitle:@"#808080" andColor:[UIColor color4]],
        [[ItemColor alloc] initWithTitle:@"#8e5af7" andColor:[UIColor color5]],
        [[ItemColor alloc] initWithTitle:@"#f07f5a" andColor:[UIColor color6]],
        [[ItemColor alloc] initWithTitle:@"#f3af22" andColor:[UIColor color7]],
        [[ItemColor alloc] initWithTitle:@"#3dacf7" andColor:[UIColor color8]],
        [[ItemColor alloc] initWithTitle:@"#e87aa4" andColor:[UIColor color9]],
        [[ItemColor alloc] initWithTitle:@"#0f2e3f" andColor:[UIColor color10]],
        [[ItemColor alloc] initWithTitle:@"#213711" andColor:[UIColor color11]],
        [[ItemColor alloc] initWithTitle:@"#511307" andColor:[UIColor color12]],
        [[ItemColor alloc] initWithTitle:@"#92003b" andColor:[UIColor color13]],
    ]];
}

@end

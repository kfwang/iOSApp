//
//  MasterViewController.m
//  iOS App
//
//  Created by Kent Wang on 9/27/17.
//  Copyright © 2017 Kent Wang. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "UserManager.h"
#import "User.h"

@interface MasterViewController () <UserManagerDelegate>

@property (nonatomic) UserManager *manager;
@property (nonatomic) NSArray *users;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.title = @"Users";
    
    _manager = [[UserManager alloc] init];
    _manager.delegate = self;
    _users = nil;
    self.title = @"Users - Loading...";
    [_manager retrieveUsers];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveUsers:(NSArray *)users {
    _users = users;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView])] withRowAnimation:UITableViewRowAnimationFade];
    self.title = @"Users";
}

- (void)didFailWithError:(NSError *)error {
    NSLog(@"%@", [error localizedDescription]);
    self.title = @"Users - Loading Error";
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        User *user = self.users[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setUser:user];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    User *user = self.users[indexPath.row];
    cell.textLabel.text = user.name;
    return cell;
}

@end

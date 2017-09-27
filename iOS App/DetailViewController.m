//
//  DetailViewController.m
//  iOS App
//
//  Created by Kent Wang on 9/27/17.
//  Copyright © 2017 Kent Wang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.user) {
        self.nameLabel.text = self.user.name;
        self.emailLabel.text = self.user.email;
        self.addressLabel.text = [NSString stringWithFormat:@"%@, %@ %@", self.user.street, self.user.city, self.user.zip];
        self.companyLabel.text = self.user.company;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"User";
    
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setUser:(User *)user {
    if (_user != user) {
        _user = user;
        
        // Update the view.
        [self configureView];
    }
}


@end

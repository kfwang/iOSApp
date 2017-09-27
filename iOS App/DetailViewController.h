//
//  DetailViewController.h
//  iOS App
//
//  Created by Kent Wang on 9/27/17.
//  Copyright © 2017 Kent Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) User *user;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@end


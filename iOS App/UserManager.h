//
//  UserManager.h
//  iOS App
//
//  Created by Kent Wang on 9/27/17.
//  Copyright © 2017 Kent Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserManagerDelegate <NSObject>

- (void)didReceiveUsers:(NSArray *)users;
- (void)didFailWithError:(NSError *)error;

@end

@interface UserManager : NSObject

@property (weak, nonatomic) id<UserManagerDelegate> delegate;

- (void)retrieveUsers;

@end

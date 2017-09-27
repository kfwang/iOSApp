//
//  UserManager.m
//  iOS App
//
//  Created by Kent Wang on 9/27/17.
//  Copyright © 2017 Kent Wang. All rights reserved.
//

#import "UserManager.h"
#import "User.h"

static NSString *const kUsersURL = @"http://jsonplaceholder.typicode.com/users";

@implementation UserManager

- (void)retrieveUsers {
    NSURL *url = [[NSURL alloc] initWithString:kUsersURL];
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!connectionError) {
            NSError *jsonError = nil;
            NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (!jsonError) {
                NSMutableArray *users = [NSMutableArray new];
                for (NSDictionary *jsonObject in jsonObjects) {
                    User *user = [[User alloc] init];
                    user.name = [jsonObject objectForKey:@"name"];
                    user.email = [jsonObject objectForKey:@"email"];
                    NSDictionary *address = [jsonObject objectForKey:@"address"];
                    user.street = [address objectForKey:@"street"];
                    user.city = [address objectForKey:@"city"];
                    user.zip = [address objectForKey:@"zipcode"];
                    user.company = [[jsonObject objectForKey:@"company"] objectForKey:@"name"];
                    [users addObject:user];                
                }
                [_delegate didReceiveUsers:users];
            } else {
                [_delegate didFailWithError:jsonError];
            }
        } else {
            [_delegate didFailWithError:connectionError];
        }
    }];
}

@end

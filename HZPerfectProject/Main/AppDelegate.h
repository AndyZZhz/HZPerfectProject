//
//  AppDelegate.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/10.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZRootTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HZRootTabBarViewController *tabBar;

+ (AppDelegate *)sharedAppDelegate ;

@end


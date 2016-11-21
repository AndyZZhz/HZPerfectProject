//
//  HZRootTabBarViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZRootTabBarViewController.h"
#import "HZHomeViewController.h"
#import "HZMineViewController.h"

@interface HZRootTabBarViewController ()
@property (nonatomic,strong) HZHomeViewController    *homeVC;
@property (nonatomic,strong) HZMineViewController    *mineVC;
@property (nonatomic,strong) UINavigationController  *homeNavitationController;
@property (nonatomic,strong) UINavigationController  *mineNavitationController;

@end

@implementation HZRootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeVC = [[HZHomeViewController alloc]init];
    self.homeVC.tabBarItem.image = [UIImage imageNamed:@"icon_xhw"];
    self.homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_xhw_pre"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.homeVC.title = @"首页";
    self.homeNavitationController = [[UINavigationController alloc]initWithRootViewController:self.homeVC];

    //
    self.mineVC = [[HZMineViewController alloc]init];
    self.homeVC.tabBarItem.image = [UIImage imageNamed:@"icon_zxs"];
    self.mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_zxs_pre"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.mineVC.title = @"我的";
    self.mineNavitationController = [[UINavigationController alloc]initWithRootViewController:self.mineVC];

    //
    self.viewControllers = @[self.homeNavitationController,self.mineNavitationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

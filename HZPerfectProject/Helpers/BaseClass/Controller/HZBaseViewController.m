//
//  HZBaseViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZBaseViewController.h"

@interface HZBaseViewController ()

@end

@implementation HZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.navigationController.viewControllers.count > 1) {
        [self setNavLeftBarButtonItemCustom:[self leftBarButtonItem]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - btnClick

- (void)backButtonClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - -
#pragma mark - title

- (void)setTitleViewWithString:(NSString *)titleStr{ //设置标题栏
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake((DEF_SCREEN_WIDTH- 180) / 2, 0, 180, 44)];
    lb.backgroundColor = [UIColor clearColor];
    lb.font = [UIFont systemFontOfSize:17];
    lb.text = titleStr;
    [lb sizeToFit];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00];
    self.navigationItem.titleView = lb;
}

#pragma mark - leftBackItem
- (void)setNavLeftBarButtonItemCustom:(UIView *)customView{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [self setNavLeftBarButtonItem:barButtonItem];
}

- (UIButton *)leftBarButtonItem{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 88/2, 44);
    [leftButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return leftButton;
}

- (void)setNavLeftBarButtonItem:(UIBarButtonItem *)barButtonItem{
    NSArray* barButtons = nil;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = - 15.0;
    barButtons = [NSArray arrayWithObjects:spacer,barButtonItem,nil ];
    [self.navigationItem setLeftBarButtonItems:barButtons];
}

#pragma mark - rightItem

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

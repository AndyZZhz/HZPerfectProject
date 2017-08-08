//
//  HZHomeViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZHomeViewController.h"

@interface HZHomeViewController ()

@end

@implementation HZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton.frame = CGRectMake(0, 0, 100, 30);
    testButton.center = CGPointMake(DEF_SCREEN_WIDTH/2.0, DEF_SCREEN_HEIGHT/2.0);
    testButton.backgroundColor = [UIColor greenColor];
    [testButton setTitle:@"录制" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
}

- (void)testButtonClick:(UIButton *)sender{
    SHOW_ALERTVC(self, @"cameraButtonClick");
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

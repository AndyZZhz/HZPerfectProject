//
//  HZHomeViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZHomeViewController.h"

@interface HZHomeViewController ()
@property (nonatomic, strong) UIView *bgView;
@end

@implementation HZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton.frame = CGRectMake(100, 100, 100, 30);
//    testButton.center = CGPointMake(DEF_SCREEN_WIDTH/2.0, DEF_SCREEN_HEIGHT/2.0);
    testButton.backgroundColor = [UIColor greenColor];
    [testButton setTitle:@"录制" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];


    self.bgView  = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor redColor];
    self.bgView.bounds = CGRectMake(0, 0, 100, 30);
    self.bgView.center = CGPointMake(self.view.centerX, self.view.centerY);
    [self.view addSubview:self.bgView];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bgView.bounds];
    titleLabel.text = @"我是个测试";
    [self.bgView addSubview:titleLabel];

    NSLog(@"self.bgView.frame:%@",NSStringFromCGRect(self.bgView.frame));
    NSLog(@"center:%@",NSStringFromCGPoint(self.bgView.center));

}

- (void)testButtonClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    if (sender.selected) {
        self.bgView.transform = CGAffineTransformMakeRotation(M_PI_2);
//        self.bgView.transform = CGAffineTransformMakeTranslation(100, 0);
    } else {
        self.bgView.transform = CGAffineTransformIdentity;
    }
    DLog(@"self.bgView.frame:%@",NSStringFromCGRect(self.bgView.frame));
    DLog(@"center:%@",NSStringFromCGPoint(self.bgView.center));

//    SHOW_ALERTVC(self, @"cameraButtonClick");
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

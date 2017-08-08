//
//  HZImagePickerViewController.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2017/2/9.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "HZImagePickerViewController.h"

@interface HZImagePickerViewController ()

@end

@implementation HZImagePickerViewController

- (void)dealloc{
    [self removeAllObsers];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cameraViewTransform = CGAffineTransformMakeScale(1.0, 1.0);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addAllObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];

    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}

- (void)removeAllObsers{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];

    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation{
    //宣告一個UIDevice指標，並取得目前Device的方向
    UIDevice *device = [UIDevice currentDevice] ;

    //取得當前Device的方向，來當作判斷敘述。（Device的方向型態為Integer）
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:{
            DLog(@"请竖屏拍摄");
            [self stopVideoCapture];
            break;
        }

        case UIDeviceOrientationFaceDown:{
            DLog(@"屏幕朝下平躺");
            [self stopVideoCapture];
            break;
        }
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:{
            DLog(@"未知方向");
            [self stopVideoCapture];
            break;
        }

        case UIDeviceOrientationLandscapeLeft:{
            DLog(@"屏幕向左橫置");
            break;
        }

        case UIDeviceOrientationLandscapeRight:{
            DLog(@"屏幕向右橫置");
            break;
        }

        case UIDeviceOrientationPortrait:{
            DLog(@"屏幕直立");
            [self stopVideoCapture];
            break;
        }

        case UIDeviceOrientationPortraitUpsideDown:{
            DLog(@"螢幕直立，上下顛倒");
            [self stopVideoCapture];
            break;
        }

        default:{
            DLog(@"无法辨别");
            [self stopVideoCapture];
            break;
        }
    }
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

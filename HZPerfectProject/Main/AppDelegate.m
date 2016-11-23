//
//  AppDelegate.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/10.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AppDelegate.h"
#import "HZGuideView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate {
    return (AppDelegate *) [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.tabBar = [[HZRootTabBarViewController alloc] init];
    self.window.rootViewController = self.tabBar;
    [self showGuideHUD];
//    [self showWatermarkHUD];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 显示引导页
- (void)showGuideHUD{
    if (![DEF_PERSISTENT_GET_OBJECT(@"showGuide") boolValue]){
        //        DEF_PERSISTENT_SET_OBJECT([NSNumber numberWithBool:YES], @"showGuide");
        HZGuideView *guide = [[HZGuideView alloc] initWithFrame:self.window.bounds];
        [self.window addSubview:guide];
    }
}

#pragma mark - 显示水印
- (void)showWatermarkHUD{
    // 文字水印
    UILabel *l          = [[UILabel alloc] initWithFrame:CGRectMake(0, DEF_SCREEN_HEIGHT - 20, DEF_SCREEN_WIDTH, 20)];
    l.backgroundColor   = [[UIColor whiteColor] colorWithAlphaComponent:.75];
    l.font              = [UIFont systemFontOfSize:10];
    l.textColor         = [UIColor blackColor];
    l.text              = @"Copyright © 2016年 Andzzhz® All rights reserved.";
    l.textAlignment     = NSTextAlignmentCenter;
    [self.window addSubview:l];
    [self.window bringSubviewToFront:l];
    
    /**
     * 加阴影
     * shadowColor阴影颜色
     * shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
     * 阴影透明度，默认0
     * 阴影半径，默认3
     */
    l.layer.shadowColor    = [UIColor blackColor].CGColor;
    l.layer.shadowOffset   = CGSizeMake(0,-3);
    l.layer.shadowRadius   = 3;
    l.layer.shadowOpacity  = 0.5;
    
    
    // 设置指定字符串的颜色值
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:l.text];
    
    // 指定颜色与字体
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:[UIColor redColor]
                          range:[l.text rangeOfString:@"Andzzhz®"]];
    
    [attributedStr addAttribute:NSFontAttributeName
                          value:[UIFont systemFontOfSize:12]
                          range:[l.text rangeOfString:@"™Andzzhz®"]];
    // 设置修改后的文本
    l.attributedText = attributedStr;
}

@end

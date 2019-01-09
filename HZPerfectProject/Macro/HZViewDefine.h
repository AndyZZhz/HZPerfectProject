//
//  HZViewDefine.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

//苹果官方屏幕尺寸的地址：https://help.apple.com/app-store-connect/#/devd274dd925

#ifndef HZViewDefine_h
#define HZViewDefine_h

/**
 *  主屏的宽
 */
#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

/**
 *  主屏的高
 */
#define DEF_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  主屏的size
 */
#define DEF_SCREEN_SIZE   [[UIScreen mainScreen] bounds].size

/**
 *  主屏的frame
 */
#define DEF_SCREEN_FRAME  [UIScreen mainScreen].applicationFrame

/**
 *  判断机型是否为 iPhone X、XR、XS、XS Max 的方法
 */
 #define IS_Has_DangerArea ( \
{BOOL result; \
if (@available(iOS 11.0, *)) {result = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0;} \
else {result = NO;} \
(result);})

/**
 *  iPhone X的判断
 */
#define iPhoneX (ScreenHeight == 812.0f)

/**
 *  定义iPhoneX非安全区域底部高度
 */
#define DangerAreaBottomHeight (IS_Has_DangerArea ? 34.0f : 0.0f)

/**
 *  Tabbar的高度
 */
#define kTabbarHeight 49

/**
 *  定义statusBar和navigationBar高度和
 */
#define kStatusBarAndNavigationBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44)

/**
 * 定义iPhoneX非安全区域底部高度
 */
#define kDangerAreaBottomHeight (IS_Has_DangerArea ? 34.0f : 0.0f)

/**
 *  判断是否为3.5屏： 4和4s的机型
 *  使用图： @2x
 *  开发尺寸：320x480 pt
 *    @return    判断结果（YES:是 NO:不是）
 */
#define DEF_640_960 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为4英寸屏 ： 5/5s/5c/5SE的机型  @2x
 *  使用图： @2x
 *  开发尺寸：320x568 pt
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_640_1136 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为4.7英寸屏 ： 6/6s/7/8的机型 @2x
 *  使用图： @2x
 *  开发尺寸：375x667 pt
 *    @return    判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_750_1334 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为5.5英寸屏 ： 6p/6sp/7p/8p的机型
 *  使用图： @3x
 *  开发尺寸：414x736 pt
 *    @return    判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_1242_2208 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为5.8英寸屏 ： iPhoneX/iPhoneXS 的机型
 *  使用图： @3x
 *  开发尺寸：375x812 pt
 *    @return    判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_1125_2436 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为6.5英寸屏 ： iPhoneXS Max/iPhoneXR 的机型
 *  使用图： @3x
 *  开发尺寸：414x896 pt
 *    @return    判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_1242_2688 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#endif /* HZViewDefine_h */

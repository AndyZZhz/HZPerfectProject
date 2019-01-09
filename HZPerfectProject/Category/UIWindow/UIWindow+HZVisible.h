//
//  UIWindow+HZVisible.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (HZVisible)

/**
获取app当前显示的页面

@return vc
*/
+ (UIViewController*)getCurrentTopViewController;

@end

NS_ASSUME_NONNULL_END

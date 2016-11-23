//
//  UIImage+Extension.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Extension)

/**
 *   创建颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *  屏幕截图
 */
+ (UIImage *)screenshot;

/**
 * 图片模糊效果
 */

- (UIImage*)blurredImage:(CGFloat)blurAmount;


@end

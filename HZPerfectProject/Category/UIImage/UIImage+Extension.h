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
 *   创建颜色图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color cornerRadius:(CGFloat)radius;

/**
 *  屏幕截图
 */
+ (UIImage *)screenshot;

/**
 * 图片模糊效果
 */

- (UIImage*)blurredImage:(CGFloat)blurAmount;

/*
 * 按照Rect截取Image里一块生成新的image
 */
- (UIImage *)getSubImage:(CGRect)rect;

/*
 * 按照size缩小
 */
- (UIImage *)scaleToSize:(CGSize)size;

/**
 * 调整图片大小至适合屏幕
 */
- (UIImage *)imageWithAspectFillStyle;

/*
 * 按照VGA缩小
 */
- (UIImage *)scaleToVGA;

/*
 * 获取图片内存大小
 */
- (size_t)imageBytesSize;

/*
 * 反转成向上方向
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;


+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

/*
 * 获取bundle中的图片
 */
+ (UIImage *)imageNamedForBundle:(NSString *)name;

/*
 * 图片模糊处理
 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

/*
 *iphone5图片处理
 */
+ (UIImage*)imageNamedForDevice:(NSString*)name;


/*
 * 根据视频地址获取第一帧的图片
 */
+ (UIImage *)getScreenShotImageFromVideoPath:(NSString *)filePath;

/*
 *从一个UIView获取UIImage
 */
+ (UIImage *)imageFromUIView:(UIView *)view;


@end

//
//  UILabel+HZStyle.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (HZStyle)

- (void)setFont:(UIFont *)font withColor:(UIColor *)color;
- (void)setFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text;
- (void)setFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text andLineSpace:(NSInteger)lineSpace;

+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color;
+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text;
+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text andLineSpace:(NSInteger)lineSpace;

@end

NS_ASSUME_NONNULL_END

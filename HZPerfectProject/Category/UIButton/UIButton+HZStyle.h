//
//  UIButton+HZStyle.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HZButtonEdgeInsetsStyle) {
    HZButtonEdgeInsetsStyleImageLeft,
    HZButtonEdgeInsetsStyleImageRight,
    HZButtonEdgeInsetsStyleImageTop,
    HZButtonEdgeInsetsStyleImageBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HZStyle)

- (void)textfont:(UIFont *)textFont text:(NSString *)title;

- (void)layoutButtonWithEdgeInsetsStyle:(HZButtonEdgeInsetsStyle)style
                        imageTitlespace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END

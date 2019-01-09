//
//  UIButton+HZStyle.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "UIButton+HZStyle.h"
#import "UIImage+Extension.h"

@implementation UIButton (HZStyle)

- (void)textfont:(UIFont *)textFont text:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.font = textFont;
    self.layer.cornerRadius  = 2.0;
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateHighlighted];
}

- (void)layoutButtonWithEdgeInsetsStyle:(HZButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space {
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    CGFloat buttonTrueWidth, buttonTrueHeight, verticalContentInset, horizontalContentInset;
    CGFloat imageInsetLeft, imageInsetRight, imageInsetTop, imageInsetBottom;
    CGFloat titleInsetLeft, titleInsetRight, titleInsetTop, titleInsetBottom;

    switch (style) {
        case HZButtonEdgeInsetsStyleImageLeft: {
            buttonTrueWidth = imageSize.width + space + titleSize.width;
            buttonTrueHeight = MAX(imageSize.height, titleSize.height);
            verticalContentInset = (CGRectGetHeight(self.bounds) - buttonTrueHeight) / 2;
            horizontalContentInset = (CGRectGetWidth(self.bounds) - buttonTrueWidth) / 2;
            imageInsetLeft = -space / 2;
            imageInsetRight = space / 2;
            imageInsetTop = 0;
            imageInsetBottom = 0;
            titleInsetLeft = space / 2;
            titleInsetRight = -space / 2;
            titleInsetTop = 0;
            titleInsetBottom = 0;
            break;
        }
        case HZButtonEdgeInsetsStyleImageRight: {
            buttonTrueWidth = imageSize.width + space + titleSize.width;
            buttonTrueHeight = MAX(imageSize.height, titleSize.height);
            verticalContentInset = (CGRectGetHeight(self.bounds) - buttonTrueHeight) / 2;
            horizontalContentInset = (CGRectGetWidth(self.bounds) - buttonTrueWidth) / 2;
            imageInsetLeft = titleSize.width + space / 2;
            imageInsetRight = -(titleSize.width + space / 2);
            imageInsetTop = 0;
            imageInsetBottom = 0;
            titleInsetLeft = -(imageSize.width + space / 2);
            titleInsetRight = imageSize.width + space / 2;
            titleInsetTop = 0;
            titleInsetBottom = 0;
            break;
        }
        case HZButtonEdgeInsetsStyleImageTop: {
            buttonTrueWidth = MAX(imageSize.width, titleSize.width);
            buttonTrueHeight = imageSize.height + space + titleSize.height;
            verticalContentInset = (CGRectGetHeight(self.bounds) - buttonTrueHeight) / 2;
            horizontalContentInset = (CGRectGetWidth(self.bounds) - buttonTrueWidth) / 2;
            imageInsetLeft = (buttonTrueWidth - imageSize.width) / 2;
            imageInsetRight = -(buttonTrueWidth - imageSize.width) / 2;
            imageInsetTop = -(buttonTrueHeight - imageSize.height) / 2;
            imageInsetBottom = (buttonTrueHeight - imageSize.height) / 2;
            titleInsetLeft = -imageSize.width;
            titleInsetRight = 0;
            titleInsetTop = (buttonTrueHeight - titleSize.height) /2;
            titleInsetBottom = -(buttonTrueHeight - titleSize.height) /2;
            break;
        }
        case HZButtonEdgeInsetsStyleImageBottom: {
            buttonTrueWidth = MAX(imageSize.width, titleSize.width);
            buttonTrueHeight = imageSize.height + space + titleSize.height;
            verticalContentInset = (CGRectGetHeight(self.bounds) - buttonTrueHeight) / 2;
            horizontalContentInset = (CGRectGetWidth(self.bounds) - buttonTrueWidth) / 2;
            imageInsetLeft = (buttonTrueWidth - imageSize.width) / 2;
            imageInsetRight = -(buttonTrueWidth - imageSize.width) / 2;
            imageInsetTop = (buttonTrueHeight - imageSize.height) / 2;
            imageInsetBottom = -(buttonTrueHeight - imageSize.height) / 2;
            titleInsetLeft = -imageSize.width;
            titleInsetRight = 0;
            titleInsetTop = -(buttonTrueHeight - titleSize.height) /2;
            titleInsetBottom = (buttonTrueHeight - titleSize.height) /2;
            break;
        }
        default:
            break;
    }
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetTop, imageInsetLeft, imageInsetBottom, imageInsetRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetTop, titleInsetLeft, titleInsetBottom, titleInsetRight);
    self.contentEdgeInsets = UIEdgeInsetsMake(verticalContentInset, horizontalContentInset, verticalContentInset, horizontalContentInset);
}

@end

//
//  UILabel+HZStyle.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "UILabel+HZStyle.h"

@implementation UILabel (HZStyle)

- (void)setFont:(UIFont *)font withColor:(UIColor *)color {
    self.textColor = color;
    self.font = font;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text {
    self.text = text ? text: @"";
    self.textColor = color;
    self.font = font;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text andLineSpace:(NSInteger)lineSpace {
    self.text = text ? text: @"";
    self.textColor = color;
    self.font = font;
    self.backgroundColor = [UIColor clearColor];

    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpace - (self.font.lineHeight - self.font.pointSize);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
}

+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color {
    UILabel *label = [[self alloc] init];
    [label setFont:font withColor:color];
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text {
    UILabel *label = [[self alloc] init];
    [label setFont:font withColor:color andText:text];
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font withColor:(UIColor *)color andText:(NSString *)text andLineSpace:(NSInteger)lineSpace {
    UILabel *label = [[self alloc] init];
    [label setFont:font withColor:color andText:text andLineSpace:lineSpace];
    return label;
}

@end

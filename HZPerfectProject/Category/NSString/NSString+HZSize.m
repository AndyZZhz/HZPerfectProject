//
//  NSString+HZSize.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSString+HZSize.h"

@implementation NSString (HZSize)

- (CGSize)sizeWithFont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    size.height = ceil(size.height);
    size.width = ceil(size.width);
    return size;
}

- (CGSize)sizeWithFont:(UIFont *)font viewWidth:(NSInteger)width {
    CGSize tempSize;
    tempSize.width = width;
    tempSize.height = 999;
    CGSize size = [self boundingRectWithSize:tempSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil].size;
    size.height = ceil(size.height);
    size.width = ceil(size.width);
    return size;
}

- (CGSize)sizeWithFont:(UIFont *)font viewWidth:(NSInteger)width lineBreakMode:(NSLineBreakMode)lineBreakMode{
    CGSize tempSize;
    tempSize.width = width;
    tempSize.height = 999;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    CGSize size = [self boundingRectWithSize:tempSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}
                                     context:nil].size;
    size.height = ceil(size.height);
    size.width = ceil(size.width);
    return size;
}

- (NSInteger)numberOfLineWithFont:(UIFont *)font viewWidth:(NSInteger)width {
    CGSize contentSize = [self sizeWithFont:font viewWidth:width];
    CGSize lineSize = [@"a" sizeWithFont:font viewWidth:width];
    NSInteger linenumber = (NSInteger)ceil(contentSize.height/lineSize.height);
    return linenumber;
}

@end

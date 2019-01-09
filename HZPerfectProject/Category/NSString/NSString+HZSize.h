//
//  NSString+HZSize.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HZSize)

- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font viewWidth:(NSInteger)width;
- (NSInteger)numberOfLineWithFont:(UIFont *)font viewWidth:(NSInteger)width;
- (CGSize)sizeWithFont:(UIFont *)font viewWidth:(NSInteger)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end

NS_ASSUME_NONNULL_END

//
//  NSString+EmojiExtension.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (EmojiExtension)

/**
 移除表情

 @return 移除表情后的字符串
 */
- (NSString*)removeEmoji;

+ (NSString *)disable_emoji:(NSString *)text;

/**
 * 字符串 表情符 的判断
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

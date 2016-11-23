//
//  NSString+Extension.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  去除回车
 */
- (NSString *)trim;

/**
 *  隐藏手机号码指定的范围，如 ---> 159xxxx4397
 *
 *  @param range 需要隐藏的数字范围。
 *
 *  @return 返回隐藏后的手机号码。
 */
- (NSString *)phoneNumberStringHideDigitsWithRange:(NSRange)range;

/**
 *  判断一串数字是不是有效的11位的电话号码。
 *
 *  @return 返回YES or NO。
 */
- (BOOL)isValidCellPhoneNumber;

/**
 *  判断设备是否支持打电话。
 *
 *  @return 返回YES or NO。
 */

- (BOOL)isSupportPhoneNumber;

/**
 *  MD5加密
 *
 *  @return MD5加密后的新字段
 */
- (NSString *)md5;

/**
 * 字符串 空 的判断
 */
+(BOOL)isBlankString:(NSString*)string;

/**
 * 字符串 表情符 的判断
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 * 字符串 去掉表情符号
 */
- (NSString*)removeEmoji;

@end

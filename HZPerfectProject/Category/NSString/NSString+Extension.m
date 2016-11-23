//
//  NSString+Extension.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

#pragma mark - 去除回车
- (NSString *)trim{
    NSString *cleanString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}

#pragma mark - MD5加密
- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    // 先转MD5，再转大写
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark - 隐藏手机号码指定的范围，如 ---> 159xxxx4397
- (NSString *)phoneNumberStringHideDigitsWithRange:(NSRange)range {
    if (self.length < range.location + range.length) {
        return self;
    }
    NSMutableString * hidePhoneNumberString = [NSMutableString stringWithString:self];
    for (NSInteger i = 0; i < range.length; i++) {
        [hidePhoneNumberString replaceCharactersInRange:NSMakeRange(range.location + i, 1) withString:@"x"];
    }
    return (NSString *)hidePhoneNumberString;
}

#pragma mark - 判断一串数字是不是有效的11位的电话号码
- (BOOL)isValidCellPhoneNumber {
    if (!self || self.length != 11) {
        return NO;
    }
    
    //判断字符串中是不是都是数字。
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    if ([self isEqualToString:filtered]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 判断设备是否支持打电话。
- (BOOL)isSupportPhoneNumber{
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType  isEqualToString:@"iPod touch"]||
       [deviceType  isEqualToString:@"iPad"]||
       [deviceType  isEqualToString:@"iPhone Simulator"]){
        return NO;
    }
    return YES;
}

#pragma mark - 空字符串判断
+ (BOOL)isBlankString:(NSString*)string{
    if (string==nil||string==NULL){
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    
    //去掉前后空格,判断length是否为空
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0){
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]||[string isEqualToString:@"null"]||[string isEqualToString:@"<null>"]){
        return YES;
    }
    return NO;
}

#pragma mark - 包含表情符号判断
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 if (hs == 0xd83e) {
                     isEomji = YES;
                     return;
                 }
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
     }];
    return isEomji;
}

- (NSString*)removeEmoji
{
    __block NSMutableString* temp = [NSMutableString string];
    
    [self enumerateSubstringsInRange: NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
         
         const unichar hs = [substring characterAtIndex: 0];
         
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             const unichar ls = [substring characterAtIndex: 1];
             const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
             
             [temp appendString: (0x1d000 <= uc && uc <= 0x1f77f)? @"": substring]; // U+1D000-1F77F
             
             // non surrogate
         } else {
             [temp appendString: (0x2100 <= hs && hs <= 0x26ff)? @"": substring]; // U+2100-26FF
         }
     }];
    
    return temp;
}

@end

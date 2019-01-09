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

- (NSString *)trim {
    NSString *cleanString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}

#pragma mark - 去除HTML

- (NSString *)removeHTML {
    NSScanner *theScanner;

    NSString *text = nil;
    NSString *html = self;

    theScanner = [NSScanner scannerWithString:html];

    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;

        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }

    return html;
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

- (BOOL)isSupportPhoneNumber {
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType  isEqualToString:@"iPod touch"]||
       [deviceType  isEqualToString:@"iPad"]||
       [deviceType  isEqualToString:@"iPhone Simulator"]){
        return NO;
    }
    return YES;
}

#pragma mark - MD5加密

- (NSString *)md5 {
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

#pragma mark - 空字符串判断

+ (BOOL)isBlankString:(NSString*)string {
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

#pragma mark - 字符串是否为url

+ (BOOL)isStringUrl:(NSString *)string {
    if ([self isBlankString:string]) {
        return NO;
    }

    //    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSString *regex = @"(https?://|www)[^ \\u4E00-\\u9FA5\\uF900-\\uFA2D]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:string];
}

#pragma mark - 获取随机的标识符

+ (NSString *)getRandomUuid {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
    CFRelease(strUuid);
    CFRelease(uuid);
    return  str;
}

#pragma mark - 保留小数

- (NSString *)safelyNumericStringToKeepOneDecimal {
    if (!self.length) {
        return @"";
    }

    CGFloat value = floor(self.floatValue * 10);
    NSString *valueString = [NSString stringWithFormat:@"%.1f", value / 10.0];
    return [NSString stringWithFormat:@"%g", valueString.floatValue];
}

@end

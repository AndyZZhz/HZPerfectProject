//
//  NSString+URLParameter.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSString+URLParameter.h"

@implementation NSString (URLParameter)

#pragma mark - URL解析

- (NSDictionary *)notificationTypeStringToTypeDictionary {
    if (self.length == 0) return nil;
    if (![self containsString:@"?"]) return @{@"type" : self};

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSUInteger index = [self rangeOfString:@"?"].location;

    NSString *value = [self substringToIndex:index];
    [dictionary setObject:value forKey:@"type"];

    NSString *extraData = [self substringFromIndex:index + 1];
    NSArray *keyValueArray = [extraData componentsSeparatedByString:@"&"];
    for (NSString *keyValue in keyValueArray) {
        NSArray *keyAndValue = [keyValue componentsSeparatedByString:@"="];
        if (keyAndValue.count == 2) {
            [dictionary setObject:keyAndValue[1] forKey:keyAndValue[0]];
        }
    }

    return dictionary.copy;
}

#pragma mark - 获取url中的参数

+ (NSString *)getParamValueFromUrl:(NSString*)url paramName:(NSString *)paramName {
    if (![paramName hasSuffix:@"="])
    {
        paramName = [NSString stringWithFormat:@"%@=", paramName];
    }

    NSString * str = nil;
    NSRange start = [url rangeOfString:paramName];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [url characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {
            NSRange end = [[url substringFromIndex:start.location+start.length] rangeOfString:@"&"];
            NSUInteger offset = start.location+start.length;
            str = end.location == NSNotFound ?
            [url substringFromIndex:offset] :
            [url substringWithRange:NSMakeRange(offset, end.location)];
            str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return str;
}

#pragma mark - 获取url中的参数

- (NSMutableDictionary *)getURLParameters {

    // 查找参数
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }

    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];

    // 截取参数
    NSString *parametersString = [self substringFromIndex:range.location + 1];

    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {

        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];

        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];

            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }

            id existValue = [params valueForKey:key];

            if (existValue != nil) {

                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];

                    [params setValue:items forKey:key];
                } else {

                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }

            } else {

                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数

        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];

        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }

        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];

        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }

        // 设置值
        [params setValue:value forKey:key];
    }

    return [params copy];
}

#pragma mark - 获取url中的参数并转化为小写字母

- (NSDictionary *)getURLParametersWithLowerCaseKey {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableDictionary *params = (NSMutableDictionary *)[self getURLParameters];
    for (NSString *key in params) {
        [dict setObject:params[key] forKey:[key lowercaseString]];
    }
    return [dict copy];
}

@end

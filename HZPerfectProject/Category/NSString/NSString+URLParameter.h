//
//  NSString+URLParameter.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLParameter)

/**
 类似URL的解析

 @"typeValue?key1=value1&key2=value2"
 =>
 @{
 @"type" : @"typeValue",
 @"key1" : @"value1",
 @"key2" : @"value2",
 }

 */
- (NSDictionary *)notificationTypeStringToTypeDictionary;

/**
 根据参数名字获取url中的参数的值

 @param url url地址
 @param paramName 参数名字
 @return 参数对应的值
 */
+ (NSString *)getParamValueFromUrl:(NSString*)url paramName:(NSString *)paramName;

/**
 获取url字符串中的参数

 @return 参数字典集合
 */
- (NSDictionary *)getURLParameters;

/**
 获取url中的参数并转化为小写字母

 @return 参数字典集合
 */
- (NSDictionary *)getURLParametersWithLowerCaseKey;

@end

NS_ASSUME_NONNULL_END

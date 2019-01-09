//
//  NSArray+HZExtension.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSArray+HZExtension.h"

@implementation NSArray (HZExtension)

+ (NSString *)convertToString:(NSArray *)array {
    if (array == nil) {
        return nil;
    }
    NSUInteger length = [array count];
    __block NSMutableString *muString = [[NSMutableString alloc] initWithCapacity:length];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if ([obj isKindOfClass:[NSString class]]) {
            [muString appendString:obj];
            if (idx != length - 1) {
                [muString appendString:@" "];
            }
        }
    }];
    return [muString copy];
}

+ (NSString *)convertToString:(NSArray *)array withSplitChar:(NSString *)splitChar {
    if (array == nil) {
        return nil;
    }
    NSUInteger length = [array count];
    __block NSMutableString *muString = [[NSMutableString alloc] initWithCapacity:length];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if ([obj isKindOfClass:[NSString class]]) {
            [muString appendString:obj];
            if (idx != length - 1) {
                [muString appendString:splitChar];
            }
        }
    }];
    return [muString copy];

}

@end

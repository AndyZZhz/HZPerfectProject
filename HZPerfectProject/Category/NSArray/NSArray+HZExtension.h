//
//  NSArray+HZExtension.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (HZExtension)

+ (NSString *)convertToString:(NSArray *)array;
+ (NSString *)convertToString:(NSArray *)array withSplitChar:(NSString *)splitChar;

@end

NS_ASSUME_NONNULL_END

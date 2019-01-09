//
//  NSString+URLEncoding.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2019/1/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncoding)

- (NSString *)URLEncodedString;

- (NSString *)URLDecodedString;

@end

NS_ASSUME_NONNULL_END

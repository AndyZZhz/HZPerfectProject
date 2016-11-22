//
//  HZNetworkManager.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/22.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface HZNetworkManager : NSObject

+ (instancetype _Nullable )manager;

- (NSURLSessionDataTask * _Nullable)POST:(NSString * _Nullable)methodName
                              parameters:(NSDictionary * _Nullable)parameters
                                 success:(nullable void (^)(id _Nullable responseObject))success
                                 failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure;

- (NSURLSessionDataTask * _Nullable)GET:(NSString * _Nullable)methodName
                             parameters:(NSDictionary * _Nullable)parameters
                                success:(nullable void (^)(id _Nullable responseObject))success
                                failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure;

- (NSURLSessionDataTask * _Nullable)upload:(NSString * _Nullable)methodName
                                parameters:( NSDictionary * _Nullable)parameters
                                     image:( UIImage * _Nullable)image
                                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress)) uploadProgressBlock
                                   success:(nullable void (^)(id _Nullable responseObject))success
                                   failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure;

- (NSURLSessionDataTask * _Nullable)upload:(NSString * _Nullable)methodName
                                parameters:( NSDictionary * _Nullable)parameters
                                       url:( NSURL * _Nullable)fileUrl
                                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress)) uploadProgressBlock
                                   success:(nullable void (^)(id _Nullable responseObject))success
                                   failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure;
@end

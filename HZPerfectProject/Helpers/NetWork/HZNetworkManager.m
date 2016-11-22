//
//  HZNetworkManager.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/22.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZNetworkManager.h"
#define URL_SERVER @"http://www.test.com/%@"

@implementation HZNetworkManager

+ (instancetype)manager
{
    static HZNetworkManager* shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)parseResponse:(NSURLResponse *) response
                 data:(NSData *) data
              success:(nullable void (^)(id _Nullable responseObject))success
              failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure
{
    NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    DLog(@"HttpResponseCode:%ld", (long)responseCode);
    DLog(@"HttpResponseBody %@",responseString);
    
    NSError *jsonError;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:&jsonError];
    if (jsonError == nil) {
        
        if (1 == [dic[@"errCode"] integerValue]) {
            if (success) {
                success(dic);
            }
        }else {
            if (failure) {
                failure([dic[@"errCode"] integerValue], dic[@"errMsg"]);
            }
        }
        
    }else{
        NSLog(@"json 解析出错");
        if (failure) {
            failure(jsonError.code, @"json 解析出错");
        }
    }
}

- (NSURLSessionDataTask *)POST:(NSString *)methodName
                    parameters:(NSDictionary *)parameters
                       success:(nullable void (^)(id _Nullable responseObject))success
                       failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure
{
    NSError *error;
    NSString *url = [NSString stringWithFormat:URL_SERVER, methodName];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                                 URLString:url
                                                                                parameters:parameters
                                                                                     error:&error];
    DLog(@"/**************************************************************/");
    DLog(@"/*************************** API STAT *************************/");
    DLog(@"/**************************************************************/");
    DLog(@"API NAME:%@", request.URL.absoluteString);
    NSString *JSON = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
    DLog(@"http body:%@", JSON);
    DLog(@"/**************************************************************/");
    DLog(@"/*************************** API STAT *************************/");
    DLog(@"/**************************************************************/");
    
    request.timeoutInterval = 6;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request
                                                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                           
                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                               
                                                               if (error) {
                                                                   DLog(@"HTTP ERROR:%@",error.localizedDescription);
                                                                   if (failure) {
                                                                       failure(error.code, error.localizedDescription);
                                                                   }
                                                               }else{
                                                                   [self parseResponse:response
                                                                                  data:data
                                                                               success:success
                                                                               failure:failure];
                                                               }
                                                           });
                                                       }];
    
    [sessionDataTask resume];
    return sessionDataTask;
}

- (NSURLSessionDataTask *)GET:(NSString *)methodName
                   parameters:(NSDictionary *)parameters
                      success:(nullable void (^)(id _Nullable responseObject))success
                      failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure
{
    NSError *error;
    NSString *url = [NSString stringWithFormat:URL_SERVER, methodName];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                 URLString:url
                                                                                parameters:parameters
                                                                                     error:&error];
    request.timeoutInterval = 6;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request
                                                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                           
                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                               if (error) {
                                                                   DLog(@"HTTP ERROR:%@",error.localizedDescription);
                                                                   if (failure) {
                                                                       failure(error.code, error.localizedDescription);
                                                                   }
                                                               }else{
                                                                   [self parseResponse:response
                                                                                  data:data
                                                                               success:success
                                                                               failure:failure];
                                                               }
                                                               
                                                           });
                                                           
                                                       }];
    
    [sessionDataTask resume];
    return sessionDataTask;
}

- (NSURLSessionDataTask *)upload:(NSString *)methodName
                      parameters:(NSDictionary *)parameters
                           image:(UIImage *)image
                        progress:(void (^)(NSProgress *uploadProgress)) uploadProgressBlock
                         success:(nullable void (^)(id _Nullable responseObject))success
                         failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure
{
    
    NSString *paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSInteger interval = (NSInteger)[[NSDate date] timeIntervalSince1970] * 1000;
    NSString *fileName = [NSString stringWithFormat:@"file_stamptime_%ld.png",(long)interval];
    NSString *filePath = [paths stringByAppendingPathComponent:fileName];
    [UIImagePNGRepresentation(image)writeToFile:filePath atomically:YES];
    
    return [self upload:methodName
             parameters:parameters
                    url:[NSURL fileURLWithPath:filePath]
               progress:uploadProgressBlock
                success:success
                failure:failure];
}

- (NSURLSessionDataTask * _Nullable)upload:(NSString * _Nullable)methodName
                                parameters:( NSDictionary * _Nullable)parameters
                                       url:( NSURL * _Nullable)fileUrl
                                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress)) uploadProgressBlock
                                   success:(nullable void (^)(id _Nullable responseObject))success
                                   failure:(nullable void (^)(NSInteger errorCode, NSString* _Nullable errorMsg))failure
{
    NSString *url = [NSString stringWithFormat:URL_SERVER, methodName];
    NSString *fileName = [fileUrl.absoluteString lastPathComponent];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"
                                                                                              URLString:url
                                                                                             parameters:parameters
                                                                              constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                                                  [formData appendPartWithFileURL:fileUrl
                                                                                                             name:@"file"
                                                                                                         fileName:fileName
                                                                                                         mimeType:@"image/png"
                                                                                                            error:nil];
                                                                              }
                                                                                                  error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager uploadTaskWithStreamedRequest:request
                                               progress:uploadProgressBlock
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                          
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              
                                              if (error) {
                                                  DLog(@"HTTP ERROR:%@",error.localizedDescription);
                                                  if (failure) {
                                                      failure(error.code, error.localizedDescription);
                                                  }
                                              }else{
                                                  if (success) {
                                                      success(responseObject);
                                                  }
                                              }
                                          });
                                      }];
    [uploadTask resume];
    return uploadTask;
    
}

@end

//
//  HZAppMacro.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/22.
//  Copyright © 2016年 Andy. All rights reserved.
//

#ifndef HZAppMacro_h
#define HZAppMacro_h

/**
 *  NSLog DLog
 */
#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s #%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

/**
 *  UIAlertView
 */
#define SHOW_ALERT(_message_) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:_message_ delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]; \
[alert show];

/**
 *  weakSelf
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#endif /* HZAppMacro_h */

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


/**
 *	iOS8之后的AlertView的显示方式: UIAlertController
 *
 *	@param	_currentVC_      当前显示的ViewController。注意：这里一定要是VC
 *	@param	_message_        提示文案
 */
#define SHOW_ALERTVC(_currentVC_ , _message_)   UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:_message_ preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];\
[alertController addAction:cancelAction];\
[_currentVC_ presentViewController:alertController animated:YES completion:nil];

#endif /* HZAppMacro_h */

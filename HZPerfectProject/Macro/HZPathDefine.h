//
//  HZPathDefine.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#ifndef HZPathDefine_h
#define HZPathDefine_h

/**
 *  获取沙盒主目录路径
 */
#define DEF_Sandbox_HomeDir     NSHomeDirectory()

/**
 * 获取tmp目录路径
 */
#define DEF_TmpDir              NSTemporaryDirectory()

/**
 * 获取Documents目录路径
 */
#define DEF_DocumentsDir        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 * 获取Caches目录路径
 */
#define DEF_CachesDir           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 * 获取当前程序包中一个图片资源（apple.png）路径
 */
#define DEF_IMAGE_PATH(_name)   [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_name]


#endif /* HZPathDefine_h */

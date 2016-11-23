//
//  HZPersistentDefine.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#ifndef HZPersistentDefine_h
#define HZPersistentDefine_h

/**
 *	永久存储对象
 *
 *  NSUserDefaults保存的文件在tmp文件夹里
 *
 *	@param	object      需存储的对象
 *	@param	key         对应的key
 */
#define DEF_PERSISTENT_SET_OBJECT(object, key)                                                                                                 \
({                                                                                                                                             \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];                                                                          \
[defaults setObject:object forKey:key];                                                                                                    \
[defaults synchronize];                                                                                                                    \
})

/**
 *	取出永久存储的对象
 *
 *	@param	key     所需对象对应的key
 *	@return	key     所对应的对象
 */
#define DEF_PERSISTENT_GET_OBJECT(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]


/**
 *  清除 NSUserDefaults 保存的所有数据
 */
#define DEF_PERSISTENT_REMOVE_ALLDATA   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]]


/**
 *  清除 NSUserDefaults 保存的指定数据
 */
#define DEF_PERSISTENT_REMOVE(_key)                                         \
({                                                                          \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];       \
[defaults removeObjectForKey:_key];                                     \
[defaults synchronize];                                                 \
})

#endif /* HZPersistentDefine_h */

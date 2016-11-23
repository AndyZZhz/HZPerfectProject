//
//  HZColorDefine.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#ifndef HZColorDefine_h
#define HZColorDefine_h

/**
 *	生成RGB颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *
 *	@return	UIColor对象
 */
#define DEF_RGB_COLOR(_red, _green, _blue) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:1]

/**
 *	生成RGBA颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *	@param 	alpha 	blue值（0~1）
 *
 *	@return	UIColor对象
 */
#define DEF_RGBA_COLOR(_red, _green, _blue, _alpha) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:(_alpha)]

/**
 *	生成二进制颜色
 *
 *	@param 	hex 	颜色描述字符串，带“0x”开头
 *
 *	@return	UIColor对象
 */
#define DEF_HEX_COLOR(hex)          [UIColor colorWithRGBHex:hex alpha:1]


/**
 *	生成二进制颜色
 *
 *	@param 	hex 	颜色描述字符串，带“0x”开头
 *  @param 	_alpha 	透明度
 *
 *	@return	UIColor对象
 */
#define DEF_HEXA_COLOR(hex, _alpha) [UIColor colorWithRGBHex:hex alpha:_alpha]

#endif /* HZColorDefine_h */

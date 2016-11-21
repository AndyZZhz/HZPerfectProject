//
//  HZBaseTableViewCell.h
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZBaseLine.h"

@interface HZBaseTableViewCell : UITableViewCell
@property (strong, nonatomic) HZBaseLine *bottomLineView;
@property (strong, nonatomic) HZBaseLine *topLineView;
- (void)cellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath;
- (void)showBottomLine:(CGFloat)xOffset;
- (void)showTopLine:(CGFloat)xOffset;
- (void)hideBottomAndTopLine;
+ (CGFloat)cellHeightWithData:(id)data;
+ (CGFloat)cellHeight;

@end

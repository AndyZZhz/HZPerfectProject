//
//  HZBaseTableViewCell.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZBaseTableViewCell.h"

@implementation HZBaseTableViewCell

- (void)awakeFromNib{
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)hideBottomAndTopLine{
    [self.topLineView removeFromSuperview];
    [self.bottomLineView removeFromSuperview];
}

- (void)showBottomLine:(CGFloat)xOffset{
    if (!self.bottomLineView) {
        self.bottomLineView = [[HZBaseLine alloc] init];
        self.bottomLineView.backgroundColor = [UIColor lightGrayColor];
    }
    self.bottomLineView.frame = CGRectMake(xOffset, [[self class] cellHeight] - 0.5, DEF_SCREEN_WIDTH*2, 0.5);
    if (![self.bottomLineView superview]) {
        [self.contentView addSubview:self.bottomLineView];
    }
}

- (void)showTopLine:(CGFloat)xOffset{
    if (!self.topLineView) {
        self.topLineView = [[HZBaseLine alloc] init];
    }
    self.topLineView.frame = CGRectMake(xOffset, 0, DEF_SCREEN_WIDTH*2, 0.5);
    if (![self.topLineView superview]) {
        [self.contentView addSubview:self.topLineView];
    }
}

- (void)cellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)configUtilityButtons{
    
}

+ (CGFloat)cellHeight{
    return 100.0f;
}

+ (CGFloat)cellHeightWithData:(id)data{
    return 100.0f;
}



@end

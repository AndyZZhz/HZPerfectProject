//
//  HZGuideView.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/23.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZGuideView.h"

/**
 *  引导页张数
 */
#define DEF_GUIDE_COUNT 2

@implementation HZGuideView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.contentSize = CGSizeMake(DEF_SCREEN_WIDTH * DEF_GUIDE_COUNT, DEF_SCREEN_HEIGHT);
        self.pagingEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        
        //
        NSArray *colorsArray = @[[UIColor purpleColor],[UIColor yellowColor]];
        for (int i = 0; i < DEF_GUIDE_COUNT; i++){
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH * i, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
            //NSString *path = DEF_SCREEN_IS_640_1136 ? [NSString stringWithFormat:@"guide%d-568.png", i] : [NSString stringWithFormat:@"guide%d.png", i];
            //imageView.image = [UIImage imageWithContentsOfFile:DEF_IMAGE_PATH(path)];
            imageView.image = [UIImage imageWithColor:colorsArray[i]];
            [self addSubview:imageView];
            
            //
            UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.height -100)/2, DEF_SCREEN_WIDTH, 50)];
            tipLabel.text = @"我是引导页，点我...";
            tipLabel.textAlignment = NSTextAlignmentCenter;
            tipLabel.font = [UIFont fontWithName:@"2-" size:24];
            [imageView addSubview:tipLabel];
            
            //
            if (i == DEF_GUIDE_COUNT-1){
                imageView.userInteractionEnabled = YES;
                // 开始按钮，一般放在最后一张引导页上，frame大小自己根据需要进行调整
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
                [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(beginClick:) forControlEvents:UIControlEventTouchUpInside];
                [imageView addSubview:button];
            }
        }
    }
    return self;
}

- (void)beginClick:(UIButton *)btn
{
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

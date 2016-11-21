//
//  HZBaseLine.m
//  HZPerfectProject
//
//  Created by Andyzzhz on 2016/11/21.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "HZBaseLine.h"
#define LineColor [UIColor lightGrayColor]

@implementation HZBaseLine
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.borderWidth = BL_HEIGHT;
        self.horizontalLine = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat halfLineWidth = self.borderWidth / 2.0f;
    
    if (self.horizontalLine) {
        CGFloat lineTop = CGRectGetMaxY(rect) - halfLineWidth;
        CGFloat lineWidth = rect.size.width;
        CGContextSetStrokeColorWithColor(ctx, [LineColor CGColor]);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, rect.origin.x, lineTop);
        CGContextAddLineToPoint(ctx, lineWidth, lineTop);
        CGContextStrokePath(ctx);
        
        CGContextSetStrokeColorWithColor(ctx, [LineColor CGColor]);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, rect.origin.x, CGRectGetMaxY(rect));
        CGContextAddLineToPoint(ctx, lineWidth, CGRectGetMaxY(rect));
        CGContextStrokePath(ctx);
    } else {
        CGFloat lineTop = CGRectGetMaxX(rect) - halfLineWidth;
        CGFloat lineHeight = rect.size.height;
        CGContextSetStrokeColorWithColor(ctx, [LineColor CGColor]);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, lineTop, rect.origin.y);
        CGContextAddLineToPoint(ctx, lineTop, lineHeight);
        CGContextStrokePath(ctx);
        
        CGContextSetStrokeColorWithColor(ctx, [LineColor CGColor]);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, CGRectGetMaxX(rect), rect.origin.y);
        CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), lineHeight);
        CGContextStrokePath(ctx);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

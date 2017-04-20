//
//  LineView.m
//  DrawRect
//
//  Created by beyondSoft on 16/7/27.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _lineColor = [UIColor blackColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [_lineColor setStroke];

    UIBezierPath * path = [UIBezierPath bezierPath];

    path.lineWidth = CGRectGetHeight(rect);
    path.lineCapStyle = kCGLineCapRound;//线条拐角处理
    path.lineJoinStyle = kCGLineCapRound;//终点处理

    [path moveToPoint:CGPointMake(0, 0)];

    [path addLineToPoint:CGPointMake(CGRectGetWidth(rect), 0)];

    //当绘制多边形的时候会把起点和终点进行连线
    //[path closePath];
    [path stroke];
}

@end

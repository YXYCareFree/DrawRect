//
//  CircularView.m
//  DrawRect
//
//  Created by beyondSoft on 16/9/9.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "CircularView.h"
//圆形
@implementation CircularView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];

    if (self) {

        _fillColor = [UIColor clearColor];
        _strokeColor = [UIColor clearColor];

        _direction = 0;
        _lineWidth = 2;
        
        _startAngle = 0;
        _endAngle = 2* M_PI;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();//一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画

   CGContextSetFillColorWithColor(context, [_fillColor CGColor]);//填充颜色

    CGContextSetStrokeColorWithColor(context, [_strokeColor CGColor]);//画线笔的颜色

    CGContextSetLineWidth(context, _lineWidth);//线的宽度

    CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, rect.size.height / 2 - _lineWidth, _startAngle, _endAngle, _direction);//添加一个圆，x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。

    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径
}


@end

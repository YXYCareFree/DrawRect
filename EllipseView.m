//
//  EllipseView.m
//  DrawRect
//
//  Created by beyondSoft on 16/9/9.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//
//椭圆
#import "EllipseView.h"

@implementation EllipseView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();

    //填充矩形中的椭圆
  //  CGContextFillEllipseInRect(context, rect);
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 70, 60));
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);

    CGContextSetLineWidth(context, 1);

    CGContextDrawPath(context, kCGPathStroke);
}


@end

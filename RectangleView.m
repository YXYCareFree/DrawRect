//
//  RectangleView.m
//  DrawRect
//
//  Created by beyondSoft on 16/9/9.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

//矩形
//http://www.jianshu.com/p/1d0e405f166e   CGContext的使用
#import "RectangleView.h"

@implementation RectangleView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        _fillColor = [UIColor clearColor];
        _strokeColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [_fillColor CGColor]);
    CGContextSetStrokeColorWithColor(context, [_strokeColor CGColor]);


    CGContextAddRect(context, rect);


//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, rect.size.width, 0);
//    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//    CGContextAddLineToPoint(context, 0, rect.size.height);
//    CGContextAddLineToPoint(context, 0, 0);

    //设置线宽
    CGContextSetLineWidth(context, 5);
//    kCGPathFill,用非零绕数规则填充颜色，没有轮廓线
//    kCGPathEOFill,表示用奇偶规则填充颜色，没有轮廓线
//    kCGPathStroke,
//    kCGPathFillStroke,
//    kCGPathEOFillStroke
    CGContextDrawPath(context, kCGPathEOFillStroke);


}


@end

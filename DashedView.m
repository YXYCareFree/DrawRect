//
//  DashedView.m
//  DrawRect
//
//  Created by beyondSoft on 16/9/9.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

//虚线
#import "DashedView.h"

@implementation DashedView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _lineColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat lengths[] = {10,10};

    /**
     *  phase表示在第一个虚线绘制时跳过多少个点
     *  lengths {10,10}表示先绘制10个点再跳过10个点再绘制10个点如此反复；  
     *  lengths {10，20，10}表示先绘制10个点再跳过20个点绘制10个点再跳过10个点绘制20个点如此反复
     *  count的值等于lengths数组的长度
     */
    CGContextSetLineDash(context, 0, lengths, 2);

    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextSetStrokeColorWithColor(context, [_lineColor CGColor]);
    CGContextSetLineWidth(context, rect.size.height);
    CGContextDrawPath(context, kCGPathStroke);
}


@end

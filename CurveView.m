//
//  CurveView.m
//  DrawRect
//
//  Created by beyondSoft on 16/7/27.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

#import "CurveView.h"
//曲线
@implementation CurveView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextAddQuadCurveToPoint(context, 20, 10, 0, 30);

    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);

    CGContextDrawPath(context, kCGPathStroke);

    //写文字
//     CGContextSetRGBFillColor(context, 1, 1, 1, 1);
//    UIFont * font = [UIFont boldSystemFontOfSize:15];
//    [@"换线" drawInRect:rect withFont:font];
    // [self drawInRect:rect withAttributes:];

}

@end

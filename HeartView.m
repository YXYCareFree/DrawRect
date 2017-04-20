//
//  HeartView.m
//  DrawRect
//
//  Created by beyondSoft on 16/7/27.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//


/**
 *  http://justsee.iteye.com/blog/1972853  UIBezierPath的使用
 *
 */

#define RandColor DMRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define DMRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#import "HeartView.h"

@implementation HeartView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {

        _fillColor = RandColor;
        _strokeColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

- (void)animateInView:(UIView *)view{

    NSTimeInterval duration = 4;
    CGFloat heartWidth = CGRectGetWidth(self.bounds);
    CGFloat heartCenterX = self.center.x;
    CGFloat viewHeight = CGRectGetHeight(view.bounds);

    //动画的准备
    self.transform = CGAffineTransformMakeScale(0, 0);
    self.alpha = 0;

    //产生❤️冒出来的动画效果
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{

        self.alpha = 1;
        self.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {

    }];

    //产生>=0,<2的整数
    NSInteger i = arc4random_uniform(2);
    //产生1或-1
    NSInteger direction = 1 - (2 * i);
    NSInteger rotationFraction = arc4random_uniform(10);

    [UIView animateWithDuration:duration animations:^{

        self.transform = CGAffineTransformMakeRotation(direction * M_PI / (16 + rotationFraction * 0.2));
    }];

    //绘制运动路径
    UIBezierPath * heartTravelPath = [UIBezierPath bezierPath];
   //设置起点
    [heartTravelPath moveToPoint:self.center];
   //随机产生终点
    CGPoint endPoint = CGPointMake(heartCenterX + (direction) * arc4random_uniform(2 * heartWidth), viewHeight / 6 + arc4random_uniform(viewHeight / 4));

    NSLog(@"self.center==%@", NSStringFromCGPoint(self.center));
    NSLog(@"%@", NSStringFromCGPoint(endPoint));
    //产生随机控制点
    CGFloat xOffset = (heartWidth / 2 + arc4random_uniform(2 * heartWidth)) * direction;
    CGFloat yOffset = MAX(endPoint.y, MAX(arc4random_uniform(8 * heartWidth), heartWidth));
    CGPoint controlPoint1 = CGPointMake(heartCenterX + xOffset, viewHeight - yOffset);
    CGPoint controlPoint2 = CGPointMake(heartCenterX - 2 * xOffset, yOffset);

    [heartTravelPath addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];

    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = heartTravelPath.CGPath;

    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:@"positionOnPath"];

    //heart消失
    [UIView animateWithDuration:duration animations:^{

        self.alpha = 0;

    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [_strokeColor setStroke];
    [_fillColor setFill];

    CGFloat drawingPadding = 4.0;
    CGFloat curveRadius = floor((CGRectGetWidth(rect) - 2*drawingPadding) / 4.0);

    //Creat path
    UIBezierPath *heartPath = [UIBezierPath bezierPath];

    //Start at bottom heart tip
    CGPoint tipLocation = CGPointMake(floor(CGRectGetWidth(rect) / 2.0), CGRectGetHeight(rect) - drawingPadding);
    [heartPath moveToPoint:tipLocation];

    //Move to top left start of curve
    CGPoint topLeftCurveStart = CGPointMake(drawingPadding, floor(CGRectGetHeight(rect) / 2.4));

    [heartPath addQuadCurveToPoint:topLeftCurveStart controlPoint:CGPointMake(topLeftCurveStart.x, topLeftCurveStart.y + curveRadius)];

    //Create top left curve
    [heartPath addArcWithCenter:CGPointMake(topLeftCurveStart.x + curveRadius, topLeftCurveStart.y) radius:curveRadius startAngle:M_PI endAngle:0 clockwise:YES];

    //Create top right curve
    CGPoint topRightCurveStart = CGPointMake(topLeftCurveStart.x + 2*curveRadius, topLeftCurveStart.y);
    [heartPath addArcWithCenter:CGPointMake(topRightCurveStart.x + curveRadius, topRightCurveStart.y) radius:curveRadius startAngle:M_PI endAngle:0 clockwise:YES];

    //Final curve to bottom heart tip
    CGPoint topRightCurveEnd = CGPointMake(topLeftCurveStart.x + 4*curveRadius, topRightCurveStart.y);
    [heartPath addQuadCurveToPoint:tipLocation controlPoint:CGPointMake(topRightCurveEnd.x, topRightCurveEnd.y + curveRadius)];

    [heartPath fill];
    heartPath.lineWidth = 1;
    heartPath.lineCapStyle = kCGLineCapRound;
    heartPath.lineJoinStyle = kCGLineCapRound;
    [heartPath stroke];

}

@end

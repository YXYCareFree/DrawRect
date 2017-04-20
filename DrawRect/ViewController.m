//
//  ViewController.m
//  DrawRect
//
//  Created by beyondSoft on 16/7/27.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"
#import "LineView.h"
#import "CurveView.h"
#import "RectangleView.h"
#import "EllipseView.h"
#import "DashedView.h"
#import "CircularView.h"
/**
 *  http://justsee.iteye.com/blog/1972853  UIBezierPath的使用
 *  http://www.jianshu.com/p/1d0e405f166e   CGContext的使用
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timer)];
//    [self.view addGestureRecognizer:tap];

    LineView * line = [[LineView alloc] initWithFrame:CGRectMake(100, 100, 100, 10)];
    line.lineColor = [UIColor grayColor];
    [self.view addSubview:line];

//    曲线
    CurveView * view = [CurveView new];
    view.frame = CGRectMake(60, 60, 100, 60);
    [self.view addSubview:view];

    //矩形
    RectangleView * rectView = [RectangleView new];
    rectView.frame = CGRectMake(100, 200, 100, 100);
    rectView.fillColor = [UIColor redColor];
    rectView.strokeColor = [UIColor purpleColor];
    [self.view addSubview:rectView];

    [self performSelector:@selector(changeRectViewFillColor:) withObject:rectView afterDelay:3];

    //椭圆
    EllipseView * ellipseView = [EllipseView new];
    ellipseView.frame = CGRectMake(60, 400, 100, 120);
    
    [self.view addSubview:ellipseView];


    //虚线
    DashedView * dashed = [DashedView new];
    dashed.lineColor = [UIColor purpleColor];
    dashed.frame = CGRectMake(30, 30, 100, 5);
    [self.view addSubview:dashed];

    //圆
    CircularView * circularView = [CircularView new];
    circularView.frame = CGRectMake(100, 60, 70, 70);
    circularView.fillColor = [UIColor blackColor];
    circularView.strokeColor = [UIColor redColor];
    circularView.startAngle = 0;
    circularView.endAngle = M_PI / 4 * 3;
    circularView.direction = 1;
    circularView.lineWidth = 3;
    [self.view addSubview:circularView];
}

- (void)changeRectViewFillColor:(id)sender{

    RectangleView * view = (RectangleView *)sender;
    RectangleView * view1 = [RectangleView new];
    view1.frame = view.frame;
    view1.strokeColor = view.strokeColor;
    view1.fillColor = [UIColor grayColor];
    [self.view addSubview:view1];
    [view removeFromSuperview];

}

- (void)timer{
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(heartAnimation) userInfo:nil repeats:YES];
}
- (void)heartAnimation{

    HeartView * heart = [[HeartView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) / 2 - 20, CGRectGetHeight(self.view.bounds) - 20, 40, 40)];
    [self.view addSubview:heart];
    [heart animateInView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

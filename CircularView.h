//
//  CircularView.h
//  DrawRect
//
//  Created by beyondSoft on 16/9/9.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
//圆形
@interface CircularView : UIView

@property (nonatomic, strong) UIColor * fillColor;//填充颜色默认为clear

@property (nonatomic, strong) UIColor * strokeColor;//颜色默认为clear

@property (nonatomic, assign) CGFloat lineWidth;//默认为2

@property (nonatomic, assign) CGFloat startAngle;//默认为0

@property (nonatomic, assign) CGFloat endAngle;//默认为2 * M_PI

@property (nonatomic, assign) int direction;//只能是0/1, 0代表顺时针画圆，1代表逆时针////默认为0

@end

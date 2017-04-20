//
//  HeartView.h
//  DrawRect
//
//  Created by beyondSoft on 16/7/27.
//  Copyright © 2016年 beyondSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeartView : UIView

@property (nonatomic, strong) UIColor * fillColor;

@property (nonatomic, strong) UIColor * strokeColor;

- (void)animateInView:(UIView *)view;

@end

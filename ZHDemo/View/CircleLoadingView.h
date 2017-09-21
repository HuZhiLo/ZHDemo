//
//  CircleLoadingView.h
//  ZHDemo
//
//  Created by huzhi on 2017/8/15.
//  Copyright © 2017年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLoadingView : UIView

+ (void)startLoadingInView:(UIView *)view;
+ (void)stopLoading;

@end

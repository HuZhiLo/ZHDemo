//
//  ZHSliderMenu.m
//  ZHDemo
//
//  Created by huzhi on 2017/8/17.
//  Copyright © 2017年 ZhiHu. All rights reserved.
//

#import "ZHSliderMenu.h"

@interface ZHSliderMenu ()

@property (nonatomic, strong)UIView *frontView;

@end

#define EXTRAAREA 30.0f

@implementation ZHSliderMenu

- (instancetype)init {
    if (self = [super init]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.frame = CGRectMake(-keyWindow.frame.size.width/2 - EXTRAAREA, 0, keyWindow.frame.size.width/2 + EXTRAAREA, keyWindow.frame.size.height);
        self.backgroundColor = [UIColor clearColor];
        self.frontView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, keyWindow.frame.size.width, keyWindow.frame.size.height)];
        self.frontView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.frontView];
//        [keyWindow insertSubview:self belowSubview:(nonnull UIView *)]
    }
    return self;
}

- (void)moveToScreen {
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = self.bounds;
    }];
}

@end

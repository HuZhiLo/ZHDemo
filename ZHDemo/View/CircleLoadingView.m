//
//  CircleLoadingView.m
//  ZHDemo
//
//  Created by huzhi on 2017/8/15.
//  Copyright © 2017年 ZhiHu. All rights reserved.
//

#import "CircleLoadingView.h"

@interface CircleLoadingView ()<CAAnimationDelegate>
@property (nonatomic, assign)CGPoint centerPoint;
@property (nonatomic, assign)UIColor *ballColor;

@property (nonatomic, strong)UIView *ball_1;
@property (nonatomic, strong)UIView *ball_2;
@property (nonatomic, strong)UIView *ball_3;

@end

static CGFloat BALL_RADIUS = 20.0f;
static CGFloat HEIGHT = 120;
static CGFloat WIDTH = 120;
static CircleLoadingView *loadingView;

@implementation CircleLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSetup];
        [self initBallView];
        [self createBezierPath];
    }
    return self;
}

+ (void)startLoadingInView:(UIView *)view {
    if (!loadingView) {
        loadingView = [[self alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    }
    loadingView.center = view.center;
    [view addSubview:loadingView];
}
+ (void)stopLoading {
    [loadingView removeFromSuperview];
}

- (void)initSetup {

    self.centerPoint = self.center;
    self.ballColor = [UIColor redColor];
}

- (void)initBallView {
    
    UIVisualEffectView *bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    bgView.alpha = 0.9f;
    bgView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));

    bgView.layer.cornerRadius = BALL_RADIUS / 2;
    bgView.clipsToBounds = YES;
    [self addSubview:bgView];
    
    
    self.ball_1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BALL_RADIUS, BALL_RADIUS)];
    self.ball_1.center = CGPointMake(_centerPoint.x - BALL_RADIUS, _centerPoint.y);
    self.ball_1.backgroundColor = self.ballColor;
    self.ball_1.layer.cornerRadius = BALL_RADIUS / 2;
    [self addSubview:self.ball_1];
    
    self.ball_2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BALL_RADIUS, BALL_RADIUS)];
    self.ball_2.center = _centerPoint;
    self.ball_2.backgroundColor = self.ballColor;
    self.ball_2.layer.cornerRadius = BALL_RADIUS / 2;
    [self addSubview:self.ball_2];
    
    self.ball_3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BALL_RADIUS, BALL_RADIUS)];
    self.ball_3.center = CGPointMake(_centerPoint.x + BALL_RADIUS, _centerPoint.y);
    self.ball_3.backgroundColor = self.ballColor;
    self.ball_3.layer.cornerRadius = BALL_RADIUS / 2;
    [self addSubview:self.ball_3];
}

- (void)createBezierPath {
    UIBezierPath *path_ball_1 = [UIBezierPath bezierPath];
    [path_ball_1 moveToPoint:self.ball_1.center];
    [path_ball_1 addArcWithCenter:_centerPoint radius:BALL_RADIUS startAngle:M_PI endAngle:M_PI * 2 clockwise:NO];
    UIBezierPath *path_ball_1_1 = [UIBezierPath bezierPath];
    [path_ball_1_1 addArcWithCenter:_centerPoint radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    [path_ball_1 appendPath:path_ball_1_1];
    
    CAKeyframeAnimation *animation_ball_1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_1.path = path_ball_1.CGPath;
    animation_ball_1.removedOnCompletion = NO;
    animation_ball_1.fillMode = kCAFillModeForwards;
    animation_ball_1.calculationMode = kCAAnimationCubic;
    animation_ball_1.repeatCount = 1;
    animation_ball_1.duration = 1.4;
    animation_ball_1.delegate = self;
    animation_ball_1.autoreverses = NO;
    animation_ball_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.ball_1.layer addAnimation:animation_ball_1 forKey:@"animation"];
    
    UIBezierPath *path_ball_3 = [UIBezierPath bezierPath];
    [path_ball_3 moveToPoint:self.ball_3.center];
    [path_ball_3 addArcWithCenter:_centerPoint radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    UIBezierPath *path_ball_3_1 = [UIBezierPath bezierPath];
    [path_ball_3_1 addArcWithCenter:_centerPoint radius:BALL_RADIUS startAngle:M_PI endAngle:2 * M_PI clockwise:NO];
    [path_ball_3 appendPath:path_ball_3_1];
    
    CAKeyframeAnimation *animation_ball_3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_3.path = path_ball_3.CGPath;
    animation_ball_3.removedOnCompletion = NO;
    animation_ball_3.fillMode = kCAFillModeForwards;
    animation_ball_3.calculationMode = kCAAnimationCubic;
    animation_ball_3.repeatCount = 1;
    animation_ball_3.duration = 1.4;
    //    animation_ball_3.delegate = self;
    animation_ball_3.autoreverses = NO;
    animation_ball_3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.ball_3.layer addAnimation:animation_ball_3 forKey:@"animation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        self.ball_1.transform = CGAffineTransformMakeTranslation(-BALL_RADIUS, 0);
        self.ball_1.transform = CGAffineTransformScale(self.ball_1.transform, 0.7, 0.7);
        
        self.ball_3.transform = CGAffineTransformMakeTranslation(BALL_RADIUS, 0);
        self.ball_3.transform = CGAffineTransformScale(self.ball_3.transform, 0.7, 0.7);
        
        
        self.ball_2.transform = CGAffineTransformScale(self.ball_2.transform, 0.7, 0.7);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn  | UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.ball_1.transform = CGAffineTransformIdentity;
            self.ball_3.transform = CGAffineTransformIdentity;
            self.ball_2.transform = CGAffineTransformIdentity;
        } completion:NULL];
    }];
    
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self createBezierPath];
}

@end

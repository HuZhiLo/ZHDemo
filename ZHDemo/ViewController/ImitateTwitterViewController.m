//
//  ImitateTwitterViewController.m
//  ZHDemo
//
//  Created by huzhi on 2017/8/18.
//  Copyright © 2017年 ZhiHu. All rights reserved.
//

#import "ImitateTwitterViewController.h"

@interface ImitateTwitterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

@end

@implementation ImitateTwitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *maskLayer = [CALayer layer];
    maskLayer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
    maskLayer.frame = CGRectMake(0, 0, _photoImage.frame.size.width, _photoImage.frame.size.height);
    _photoImage.layer.mask = maskLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

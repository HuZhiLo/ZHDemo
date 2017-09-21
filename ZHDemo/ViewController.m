//
//  ViewController.m
//  ZHDemo
//
//  Created by huzhi on 2017/7/19.
//  Copyright © 2017年 ZhiHu. All rights reserved.
//

#import "ViewController.h"
#import "HKSlideMenu3DController.h"
#import "CircleLoadingViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = @[@"sliderView",@"circleLoadingView"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

#pragma mark ----delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [CircleLoadingView startLoadingInView:self.view];
    }
    else if (indexPath.row == 1) {
        [CircleLoadingView stopLoading];
    }
}


@end

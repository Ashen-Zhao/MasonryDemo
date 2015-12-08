//
//  ViewController.m
//  MasonryDemo
//
//  Created by Ashen on 15/11/25.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "ViewController.h"
#import "MidViewController.h"
#import "HightViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).offset(10);
        make.right.equalTo(sv3.mas_left).offset(-10);
        make.height.equalTo(@(150));
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).offset(10);
        make.right.equalTo(sv.mas_right).offset(-10);
        make.height.equalTo(@(150));
        make.width.equalTo(sv2);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"进入中级" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(goMidMasonry) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@(40));
    }];
    
    
    UIButton *highBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [highBtn setTitle:@"进入高级" forState:UIControlStateNormal];
    highBtn.backgroundColor = [UIColor lightGrayColor];
    [highBtn addTarget:self action:@selector(goHightMasonry) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:highBtn];
    [highBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).offset(20);
        make.left.right.equalTo(btn);
        make.height.equalTo(btn);
    }];
    
}

- (void)goMidMasonry {
    MidViewController *midVC = [[MidViewController alloc] init];
    [self.navigationController pushViewController:midVC animated:YES];
}
- (void)goHightMasonry {
    HightViewController *hightVC = [[HightViewController alloc] init];
    [self.navigationController pushViewController:hightVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

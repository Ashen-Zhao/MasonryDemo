//
//  MidViewController.m
//  MasonryDemo
//
//  Created by Ashen on 15/11/25.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "MidViewController.h"


@interface MidViewController ()

@end

@implementation MidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 5, 0, 5));
    }];

    UIView *containerView = [UIView new];
    [scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    UIView *lastView = nil;
    for (int i = 1; i < 10; i++) {
        UIView *subView = [UIView new];
        subView.backgroundColor =  [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                              saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                              brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                                   alpha:1];
        [containerView addSubview:subView];
        
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(containerView);
            make.height.equalTo(@(20 * i));
            
            if (lastView) {
                make.top.equalTo(lastView.mas_bottom).offset(5);
            } else {
                make.top.equalTo(containerView.mas_top).offset(5);
            }
        }];
        lastView = subView;
    }
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
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

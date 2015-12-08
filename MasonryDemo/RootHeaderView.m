//
//  RootHeaderView.m
//  MasonryDemo
//
//  Created by Ashen on 15/11/30.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "RootHeaderView.h"

@implementation RootHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         self.t = [[TV alloc] initWithFrame:CGRectMake(0, 0, 320, 500) style:UITableViewStyleGrouped];
        [self addSubview:_t];
    }
   
    return self;
}
@end

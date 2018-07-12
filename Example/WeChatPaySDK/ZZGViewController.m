//
//  ZZGViewController.m
//  WeChatPaySDK
//
//  Created by wanghuizhou21@163.com on 07/12/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "ZZGViewController.h"
#import <WeChatPaySDK/MSWechatPayHelper.h>

@interface ZZGViewController ()

@end

@implementation ZZGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MSWechatPayHelper WeChatPayTest];
}

@end

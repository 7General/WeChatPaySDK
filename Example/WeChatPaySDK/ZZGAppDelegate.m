//
//  ZZGAppDelegate.m
//  WeChatPaySDK
//
//  Created by wanghuizhou21@163.com on 07/12/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "ZZGAppDelegate.h"

#import <WeChatPaySDK/MSWeChatPaySDK.h>
/// 调用WeChatPaySDK的swift文件
//#import "WeChatPaySDK-Swift.h"



@implementation ZZGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //注册微信支付
    [[MSWechatPayHelper defaultManager] initWithWeChat:@"" universalLink:@""];
    [[MSWechatPayHelper defaultManager] checkIfNeed];
    
//    [WXApi registerApp:@"wx6d4e7e840eb7db70" universalLink:@"https://whz.wangxiaoguang.com/"];
//    [WXApi checkUniversalLinkReady:^(WXULCheckStep step, WXCheckULStepResult* result) {
//        NSLog(@">>>>>>>%@, %u, %@, %@", @(step), result.success, result.errorInfo, result.suggestion);
//    }];
    
//    MSWeChatPayTool * tool = [[MSWeChatPayTool alloc] init];
//    [tool setup];
    
    return YES;
}



@end

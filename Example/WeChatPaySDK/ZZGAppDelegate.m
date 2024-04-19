//
//  ZZGAppDelegate.m
//  WeChatPaySDK
//
//  Created by wanghuizhou21@163.com on 07/12/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "ZZGAppDelegate.h"
#import <WeChatPaySDK/MSWechatPayHelper.h>

@implementation ZZGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //注册微信支付
    [[MSWechatPayHelper defaultManager] initWithWeChat:@"" universalLink:@""];
//    [[MSWechatPayHelper defaultManager] weChatPaySchemeId:MXWechatAPPID];
    
    //调用自检函数
    [WXApi checkUniversalLinkReady:^(WXULCheckStep step, WXCheckULStepResult* result) {
        NSLog(@">>>>>>>%@, %u, %@, %@", @(step), result.success, result.errorInfo, result.suggestion);
    }];
//    [[ZZGPayHelper defaultManager] initWithWeChatPaySchemeId:MXWechatAPPID];
    return YES;
}



@end

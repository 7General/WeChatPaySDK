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
	
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if([MSWechatPayHelper canSupportPay]){
        NSLog(@"----yes");
    } else {
        NSLog(@"----no");
    }

    
    
//    [[MSWechatPayHelper defaultManager] payShareMediaMessageWithTitle:@"ddddd" description:@"osjoin" thumbImage:[UIImage imageNamed:@"123.jpg"] shareURL:@"www.osjoin.com" shareType:(GZPayWeChatShareTypeFriend) weChatResult:^(BOOL result) {
//        NSLog(@"----------------------------%d",result);
//    }];
    
//    [[MSWechatPayHelper defaultManager] WeChatPayTestweChatResult:^(BOOL result) {
//        NSLog(@"===>>>>>>>%d",result);
//    }];
    
    [[MSWechatPayHelper defaultManager] WeChatPayTest];
    /*
    <xml><app><![CDATA[
     {"appId":"wx16e73c94cb7048ac",
     "partnerId":"1500131252",
     "prepayId":"wx181040418508336feeb5d18a1967689595",
     "package":"Sign=WXPay",
     "nonceStr":"5b4ea8a9d5d9a",
     "timeStamp":"1531881641",
     "sign":"B04B36F82A02BEBE49C0BA84D1844E80"
     }
     ]]></app><appid><![CDATA[wx16e73c94cb7048ac]]></appid><mch_id>1500131252</mch_id><nonce_str><![CDATA[tApMa7XTNYI3PzLN]]></nonce_str><prepay_id><![CDATA[wx181040418508336feeb5d18a1967689595]]></prepay_id><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg><trade_type><![CDATA[APP]]></trade_type><sign><![CDATA[478DB5E6D31C08A5E17F3F01A1D339D1]]></sign></xml>
     */
    
//    MSSendPayRequest * request = [[MSSendPayRequest alloc] init];
//    request.openID = @"wx16e73c94cb7048ac";
//    request.partnerId = @"1500131252";
//    request.prepayId = @"wx181040418508336feeb5d18a1967689595";
//    request.package = @"Sign=WXPay";
//    request.nonceStr = @"5b4ea8a9d5d9a";
//    request.timeStamp = @"1531881641";
//    request.sign = @"B04B36F82A02BEBE49C0BA84D1844E80";
//    [MSWechatPayHelper WakeupWeChatPay:request];
//    [self shareweChat];
//    [self weChatLogin];
}



@end

//
//  ViewController.m
//  WxPayDemo
//
//  Created by 众网合一 on 16/6/14.
//  Copyright © 2016年 GdZwhy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //发起微信支付
    [MXWechatPayHandler jumpToWxPay];
//    [self singFunc];
}

-(void)singFunc {
    // 签名加密
    MXWechatSignAdaptor *md5 = [[MXWechatSignAdaptor alloc] init];
    
    NSString * appid = @"wx7d3568d7b68a1519";
    NSString * mchId = @"1327167401";
    NSString * noncestr = @"BPReEDlQY8G84auu";
    NSString * prepay_id = @"wx20170417113927215b8616530880618195";
    NSString * timestamp = @"1492400313";
    
    NSString * sign = [md5 createMD5SingForPay:appid
                                partnerid:mchId
                                 prepayid:prepay_id
                                  package:@"Sign=WXPay"
                                 noncestr:noncestr
                                timestamp:[timestamp intValue]];
     NSLog(@"-----%@",sign);
}



@end

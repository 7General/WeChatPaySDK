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
    
//    [MSWechatPayHelper WeChatPayTest];
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
    [self weChatLogin];
}

- (void)shareweChat {
    //创建发送对象实例
    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc] init];
    sendReq.bText = NO;//不使用文本信息
    sendReq.scene = 1;//0 = 好友列表 1 = 朋友圈 2 = 收藏
    
    //创建分享内容对象
    WXMediaMessage *urlMessage = [WXMediaMessage message];
    urlMessage.title = @"分享标题";
    urlMessage.description = @"分享描述";//
    [urlMessage setThumbImage:[UIImage imageNamed:@"123.jpg"]];
    
    //创建多媒体对象
    WXWebpageObject *webObj = [WXWebpageObject object];
    webObj.webpageUrl = @"http://www.osjoin.com";//分享链接
    
    //完成发送对象实例
    urlMessage.mediaObject = webObj;
    sendReq.message = urlMessage;
    
    //发送分享信息
    [WXApi sendReq:sendReq];
}

- (void)weChatLogin {
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo" ;
    req.state = @"123" ;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

@end

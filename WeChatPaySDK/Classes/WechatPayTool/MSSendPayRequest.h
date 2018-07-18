//
//  MSSendPayRequest.h
//  WeChatPaySDK
//
//  Created by 王会洲 on 2018/7/12.
//  用于唤起微信支付必须要传入的参数对象
//

#import <Foundation/Foundation.h>

/* 用于唤起微信支付必须要传入的参数对象 */
@interface MSSendPayRequest : NSObject
/** 由用户微信号和AppID组成的唯一标识，发送请求时第三方程序必须填写，用于校验微信用户是否换号登录*/
@property (nonatomic, retain) NSString* openID;
/** 商家向财付通申请的商家id */
@property (nonatomic, retain) NSString *partnerId;
/** 预支付订单 */
@property (nonatomic, retain) NSString *prepayId;
/** 随机串，防重发 */
@property (nonatomic, retain) NSString *nonceStr;
/** 商家根据财付通文档填写的数据和签名 */
@property (nonatomic, retain) NSString *package;
/** 时间戳，防重发 */
@property (nonatomic, retain) NSString * timeStamp;
/** 商家根据微信开放平台文档对数据做的签名 */
@property (nonatomic, retain) NSString *sign;
@end

//
//  MMApiObject.h
//  Api对象，包含所有接口和对象数据定义
//
//  Created by 王会洲 on 18-01-12.
//  Copyright (c) 2013年 GUAGUAG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - BaseReq
/*! @brief 该类为微信终端SDK所有请求类的基类
 *
 */
@interface BaseReq : NSObject

/** 请求类型 */
@property (nonatomic, assign) int type;
/** 由用户微信号和AppID组成的唯一标识，发送请求时第三方程序必须填写，用于校验微信用户是否换号登录*/
@property (nonatomic, retain) NSString* openID;

@end



#pragma mark - BaseResp
/*! @brief 该类为微信终端SDK所有响应类的基类
 *
 */
@interface BaseResp : NSObject
/** 错误码 */
@property (nonatomic, assign) int errCode;
/** 错误提示字符串 */
@property (nonatomic, retain) NSString *errStr;
/** 响应类型 */
@property (nonatomic, assign) int type;

@end



#pragma mark - WXMediaMessage
@class WXMediaMessage;

/*! @brief 第三方向微信终端发起支付的消息结构体
 *
 *  第三方向微信终端发起支付的消息结构体，微信终端处理后会向第三方返回处理结果
 * @see PayResp
 */
@interface PayReq : BaseReq

/** 商家向财付通申请的商家id */
@property (nonatomic, retain) NSString *partnerId;
/** 预支付订单 */
@property (nonatomic, retain) NSString *prepayId;
/** 随机串，防重发 */
@property (nonatomic, retain) NSString *nonceStr;
/** 时间戳，防重发 */
@property (nonatomic, assign) UInt32 timeStamp;
/** 商家根据财付通文档填写的数据和签名 */
@property (nonatomic, retain) NSString *package;
/** 商家根据微信开放平台文档对数据做的签名 */
@property (nonatomic, retain) NSString *sign;

@end



#pragma mark - PayResp
/*! @brief 微信终端返回给第三方的关于支付结果的结构体
 *
 *  微信终端返回给第三方的关于支付结果的结构体
 */
@interface PayResp : BaseResp

/** 财付通返回给商家的信息 */
@property (nonatomic, retain) NSString *returnKey;

@end



/**
 @@create by 王会洲 2017-07-12
 
 @网址:          http://www.osjoin.com
 @简书地址:    https://www.jianshu.com/u/1338683b18e0
 @Github地址: https://github.com/7General
 @return MXWechatPayHandler（微信调用工具类）
 */

#import <Foundation/Foundation.h>
#import "MSWechatConfig.h"
#import "MSSendPayRequest.h"

@interface MSWechatPayHelper : NSObject

/**
 测试微信支付，所有的参数自己通过demo请求获取
 */
+ (void)WeChatPayTest;

/**
 唤起微信支付

 @param payRequest 唤起微信支付要传入的参数对象，
 **自行校验是否为空数据
 */
+ (void)WakeupWeChatPay:(MSSendPayRequest *)payRequest ;

@end

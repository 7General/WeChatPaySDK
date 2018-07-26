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

/*! @brief WXApi的成员函数，向微信终端程序注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。第一次调用后，会在微信的可用应用列表中出现。
 * @see registerApp
 * @param appid 微信开发者ID
 * @param appdesc 应用附加信息，长度不超过1024字节
 * @return 成功返回YES，失败返回NO。
 */
+(BOOL) registerApp:(NSString *)appid withDescription:(NSString *)appdesc;


/*! @brief 处理微信通过URL启动App时传递的数据
 *
 * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @param url 微信启动第三方应用时传递过来的URL
 * @param delegate  WXApiDelegate对象，用来接收微信触发的消息。
 * @return 成功返回YES，失败返回NO。
 */
+(BOOL) handleOpenURL:(NSURL *) url delegate:(id<WXApiDelegate>) delegate;


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

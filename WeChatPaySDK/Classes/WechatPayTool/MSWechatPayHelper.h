/**
 @@create by 王会洲 2017-07-12
 
 @网址:          http://www.osjoin.com
 @简书地址:    https://www.jianshu.com/u/1338683b18e0
 @Github地址: https://github.com/7General
 @ MXWechatPayHandler（微信调用工具类）
 */


typedef enum : NSUInteger {
    GZPayWeChatShareTypeFriend,   //微信聊天界面
    GZPayWeChatShareTypeTimeline, //微信朋友圈
    GZPayWeChatShareTypeFavorite  //微信收藏
} GZPayWeChatShareType;

#import <Foundation/Foundation.h>
#import "MSWechatConfig.h"
#import "MSSendPayRequest.h"

@interface MSWechatPayHelper : NSObject


+ (instancetype)defaultManager;


- (void)initWithWeChatPaySchemeId:(NSString *)appId;


/*! @brief WXApi的成员函数，向微信终端程序注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。第一次调用后，会在微信的可用应用列表中出现。
 * @see registerApp
 * @param appid 微信开发者ID
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL) registerApp:(NSString *)appid;


/*!
 微信支付回调

 @param url url
 @return bool
 */
- (BOOL)handleOpenUrl:(NSURL *)url;

/**
 是否支持微信支付

 @return BOOL
 */
+ (BOOL)canSupportPay;


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


/**
 分享纯文本消息

 @param textMessage 文本信息
 @param shareType 分享
 */
- (void)payShareTextMessage:(NSString *)textMessage
                  shareType:(GZPayWeChatShareType)shareType
               weChatResult:(void(^)(BOOL result))weChatResult;



/**
 微信分享URL

 @param title 标题
 @param description 描述
 @param thumbImage 缩略图
 @param shareURL 分享URL
 @param shareType 分享类型
 */
- (void)payShareMediaMessageWithTitle:(NSString *)title
                       description:(NSString *)description
                        thumbImage:(UIImage *)thumbImage
                          shareURL:(NSString *)shareURL
                            shareType:(GZPayWeChatShareType)shareType
                         weChatResult:(void(^)(BOOL result))weChatResult;

@end

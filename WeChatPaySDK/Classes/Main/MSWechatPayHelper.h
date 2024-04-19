


typedef enum : NSUInteger {
    GZPayWeChatShareTypeFriend,   //微信聊天界面
    GZPayWeChatShareTypeTimeline, //微信朋友圈
    GZPayWeChatShareTypeFavorite  //微信收藏
} GZPayWeChatShareType;

#import <Foundation/Foundation.h>
#import "WXApi.h"



@interface MSWechatPayHelper : NSObject

+ (instancetype)defaultManager;

- (instancetype)initWithWeChat:(NSString *)appId universalLink:(NSString *)unLink;


@end

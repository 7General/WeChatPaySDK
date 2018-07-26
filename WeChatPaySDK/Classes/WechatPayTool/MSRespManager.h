
/**
 @@create by 王会洲 2017-07-12
 
 @网址:          http://www.osjoin.com
 @简书地址:    https://www.jianshu.com/u/1338683b18e0
 @Github地址: https://github.com/7General
 @return WXApiManager（微信结果回调类）
 */

#import <Foundation/Foundation.h>
#import "MSWechatConfig.h"


@interface MSRespManager : NSObject<WXApiDelegate>

+ (instancetype)sharedManager;

@end

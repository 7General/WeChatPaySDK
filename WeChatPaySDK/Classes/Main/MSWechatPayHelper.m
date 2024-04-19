

#import "MSWechatPayHelper.h"
#import "WXApi.h"

@interface MSWechatPayHelper()

@end



@implementation MSWechatPayHelper

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    static MSWechatPayHelper *instance;
    dispatch_once(&onceToken, ^{
        instance = [[MSWechatPayHelper alloc] init];
    });
    return instance;
}

- (instancetype)initWithWeChat:(NSString *)appId universalLink:(NSString *)unLink {
    self = [super init];
    if (self) {
        [WXApi registerApp:@"wx6d4e7e840eb7db70" universalLink:@"https://whz.wangxiaoguang.com/"];
    }
    return self;
}
- (void)weChatPaySchemeId:(NSString *)appId {
    [self registerApp:appId];
}

/*! @brief MSWechatPayHelper的成员函数，向微信终端程序注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。第一次调用后，会在微信的可用应用列表中出现。
 * @see registerApp
 * @param appid 微信开发者ID
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL) registerApp:(NSString *)appid {
    [WXApi startLogByLevel:WXLogLevelDetail logBlock:^(NSString *log) {
        NSLog(@"---------WeChatSDK: %@", log);
    }];
    return  [WXApi registerApp:appid universalLink:@"https://gate.beihujia.com.cn/"];
}

/**
 是否支持微信支付
 
 @return BOOL
 */
+ (BOOL)canSupportPay {
    if([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]){
        return YES;
    }
    return NO;
}




#pragma mark - Public Methods
- (void)WeChatPayTest {
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = @"1300811201";
    request.prepayId = @"wx10213200472467b9d41ba9be30bdc70000";
    request.nonceStr = @"5aAkOMGYhtkNGFVK9jrIdQRPaocNqOT6";
    request.timeStamp = 1712755920;
    request.package = @"Sign=WXPay";
    request.sign = @"F10894CA9BE62CA1F7A1A9FD44F322F6";
    [WXApi sendReq:request completion:^(BOOL success) {
        
    }];
}



#pragma mark - Private Method
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    NSMutableString *resultStr = [[NSMutableString alloc] init];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshorten-64-to-32"
    srand(time(0)); // 此行代码有警告:
#pragma clang diagnostic pop
    for (int i = 0; i < kNumber; i++) {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
@end

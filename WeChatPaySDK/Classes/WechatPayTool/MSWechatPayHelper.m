/**
 @@create by 王会洲 2017-07-12
 
 @网址:          http://www.osjoin.com
 @简书地址:    https://www.jianshu.com/u/1338683b18e0
 @Github地址: https://github.com/7General
 @return MXWechatPayHandler（微信调用工具类）
 */

#import "MSWechatPayHelper.h"
//#import "AFNetworking.h"

///用户获取设备ip地址
#include <ifaddrs.h>
#include <arpa/inet.h>
#import "WXApi.h"

@interface MSWechatPayHelper()
@property (nonatomic, copy) void (^weChatResult) (BOOL result);
@property (nonatomic, strong) NSString *weCahtPayAppKey;
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

- (instancetype)initWithWeChatPaySchemeId:(NSString *)appId {
    self = [super init];
    if (self) {
        self.weCahtPayAppKey = appId;
        [self registerApp:appId];
    }
    return self;
}
- (void)weChatPaySchemeId:(NSString *)appId {
    self.weCahtPayAppKey = appId;
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


- (BOOL)handleOpenUrl:(NSURL *)url {
    if ([url.scheme isEqualToString:self.weCahtPayAppKey]) {
        return [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
    }
    return NO;
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


/**
 分享纯文本消息
 
 @param textMessage 文本信息
 @param shareType 分享
 @param shareResult 回调
 */
//- (void)payShareTextMessage:(NSString *)textMessage
//               shareType:(GZPayWeChatShareType)shareType
//               weChatResult:(void(^)(BOOL result))weChatResult {
//    //微信相关
//    if (shareType == GZPayWeChatShareTypeFriend || shareType == GZPayWeChatShareTypeTimeline || shareType == GZPayWeChatShareTypeFavorite) {
//        self.weChatResult = weChatResult;
//        NSInteger scene = WXSceneSession;
//        if (shareType == GZPayWeChatShareTypeTimeline) {
//            scene = WXSceneTimeline;
//        }
//        if (shareType == GZPayWeChatShareTypeFavorite) {
//            scene = WXSceneFavorite;
//        }
//        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
//        req.text = textMessage;
//        req.bText = YES;
//        req.scene = scene;
//        [WXApi sendReq:req];
//    }
//}
//
//
//- (void)payShareMediaMessageWithTitle:(NSString *)title
//                       description:(NSString *)description
//                        thumbImage:(UIImage *)thumbImage
//                          shareURL:(NSString *)shareURL
//                         shareType:(GZPayWeChatShareType)shareType
//                          weChatResult:(void(^)(BOOL result))weChatResult {
//    WXWebpageObject *ext = [WXWebpageObject object];
//    ext.webpageUrl = shareURL;
//    
//    if (shareType == GZPayWeChatShareTypeFriend || shareType == GZPayWeChatShareTypeTimeline || shareType == GZPayWeChatShareTypeFavorite) {
//        self.weChatResult = weChatResult;
//        NSInteger scene = WXSceneSession;
//        if (shareType == GZPayWeChatShareTypeTimeline) {
//            scene = WXSceneTimeline;
//        }
//        if (shareType == GZPayWeChatShareTypeFavorite) {
//            scene = WXSceneFavorite;
//        }
//        WXMediaMessage *message = [WXMediaMessage message];
//        message.title = title?:@"";
//        message.description = description?:@"";
//        [message setThumbImage:thumbImage];
//        message.mediaObject = ext;
//        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
//        req.bText = NO;
//        req.message = message;
//        req.scene = scene;
//        [WXApi sendReq:req];
//    }
//}

- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[PayResp class]]){
        NSString *strMsg;
        switch (resp.errCode) {
            case 0:
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                if (self.weChatResult) {
                    self.weChatResult(1);
                    self.weChatResult = nil;
                }
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                if (self.weChatResult) {
                    self.weChatResult(0);
                    self.weChatResult = nil;
                }
                break;
        }
    } else {
        switch (resp.errCode) {
            case 0:
                if (self.weChatResult) {
                    self.weChatResult(1);
                    self.weChatResult = nil;
                }
                break;
                
            default:
                if (self.weChatResult) {
                    self.weChatResult(0);
                    self.weChatResult = nil;
                }
                break;
        }
        
    }
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
    
    
//    NSString *tradeType = @"APP";                                       //交易类型
//    NSString *totalFee  = @"1";                                         //交易价格1表示0.01元，10表示0.1元
//    NSString *tradeNO   = [self generateTradeNO];                       //随机字符串变量 这里最好使用和安卓端一致的生成逻辑
//    NSString *addressIP = [self fetchIPAddress];                        //设备IP地址,请再wifi环境下测试,否则获取的ip地址为error,正确格式应该是8.8.8.8
//    NSString *orderNo   = [NSString stringWithFormat:@"%ld",time(0)];   //随机产生订单号用于测试，正式使用请换成你从自己服务器获取的订单号
//    NSString *notifyUrl = @"http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php";// 交易结果通知网站此处用于测试，随意填写，正式使用时填写正确网站
//    
//    //获取SIGN签名
//    MXWechatSignAdaptor *adaptor = [[MXWechatSignAdaptor alloc] initWithWechatAppId:MXWechatAPPID
//                                                                        wechatMCHId:MXWechatMCHID
//                                                                            tradeNo:tradeNO
//                                                                   wechatPartnerKey:MXWechatPartnerKey
//                                                                           payTitle:@"充值"
//                                                                            orderNo:orderNo
//                                                                           totalFee:totalFee
//                                                                           deviceIp:addressIP
//                                                                          notifyUrl:notifyUrl
//                                                                          tradeType:tradeType];
//    
//    //转换成XML字符串,这里只是形似XML，实际并不是正确的XML格式，需要使用AF方法进行转义
//    NSString *string = [[adaptor dic] XMLString];
//    
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    // 这里传入的XML字符串只是形似XML，但不是正确是XML格式，需要使用AF方法进行转义
//    session.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
//    [session.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [session.requestSerializer setValue:kUrlWechatPay forHTTPHeaderField:@"SOAPAction"];
//    [session.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
//        return string;
//    }];
//    
//    [session POST:kUrlWechatPay
//       parameters:string
//         progress:nil
//          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
//     {
//         
//         //  输出XML数据
//         NSString *responseString = [[NSString alloc] initWithData:responseObject
//                                                          encoding:NSUTF8StringEncoding] ;
//         //  将微信返回的xml数据解析转义成字典
//         NSDictionary *dic = [NSDictionary dictionaryWithXMLString:responseString];
//         
//         // 判断返回的许可
////         if ([[dic objectForKey:@"result_code"] isEqualToString:@"SUCCESS"]
////             &&[[dic objectForKey:@"return_code"] isEqualToString:@"SUCCESS"] ) {
//             // 发起微信支付，设置参数
//             PayReq *request = [[PayReq alloc] init];
//             request.openID = [dic objectForKey:WXAPPID];
//             request.partnerId = [dic objectForKey:WXMCHID];
//             request.prepayId= [dic objectForKey:WXPREPAYID];
//             request.package = @"Sign=WXPay";
//             request.nonceStr= [dic objectForKey:WXNONCESTR];
//             
//             // 将当前时间转化成时间戳
//             NSDate *datenow = [NSDate date];
//             NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
//             UInt32 timeStamp =[timeSp intValue];
//             request.timeStamp= timeStamp;
//             
//             // 签名加密
//             MXWechatSignAdaptor *md5 = [[MXWechatSignAdaptor alloc] init];
//             
//             request.sign=[md5 createMD5SingForPay:request.openID
//                                         partnerid:request.partnerId
//                                          prepayid:request.prepayId
//                                           package:request.package
//                                          noncestr:request.nonceStr
//                                         timestamp:request.timeStamp];
//             
//             
//             // 调用微信
////             [WXApi sendReq:request];
//             [WXApi sendReq:request completion:^(BOOL success) {
//                 
//             }];
////         }
//         
//     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         
//     }];
}

//- (void)WeChatPayTestweChatResult:(void(^)(BOOL result))weChatResult {
//    [self WeChatPayTest];
//    self.weChatResult = weChatResult;
//}


- (void)WakeupWeChatPay:(MSSendPayRequest *)payRequest {
    PayReq *request = [[PayReq alloc] init];
    request.openID = payRequest.openID;
    request.partnerId = payRequest.partnerId;
    request.prepayId= payRequest.prepayId;
    request.package = payRequest.package;
    request.nonceStr= payRequest.nonceStr;
    request.timeStamp = [payRequest.timeStamp intValue];
    request.sign= payRequest.sign;
    
    // 调用微信
    [WXApi sendReq:request completion:^(BOOL success) {
        
    }];
    
}
//- (void)WakeupWeChatPay:(MSSendPayRequest *)payRequest weChatResult:(void(^)(BOOL result))weChatResult {
//    [self WakeupWeChatPay:payRequest];
//    self.weChatResult = weChatResult;
//    
//}



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

/**
 ------------------------------
 获取设备ip地址
 ------------------------------
 1.貌似该方法获取ip地址只能在wifi状态下进行
 */
- (NSString *)fetchIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}
@end

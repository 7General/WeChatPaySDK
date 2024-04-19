


#import <Foundation/Foundation.h>

@interface MSWechatPayHelper : NSObject

+ (instancetype)defaultManager;

- (instancetype)initWithWeChat:(NSString *)appId universalLink:(NSString *)unLink;

// 调用自检函数
-(void)checkIfNeed;

@end

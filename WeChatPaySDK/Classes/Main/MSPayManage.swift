//
//  MSPayManage.swift
//  WeChatPaySDK
//
//  Created by zz on 19.4.24.
//

import UIKit
// 这里不用引用oc的头文件

public class MSPayManage: NSObject {
      @objc  public func setup(){
        print("开始注册")
        WXApi.registerApp("wx6d4e7e840eb7db70", universalLink: "https://whz.wangxiaoguang.com")
        
        print("调用自检函数")
        WXApi.checkUniversalLinkReady { step, result in
            print("\n\n----\(step)===\(result.success)===\(result.errorInfo)====\(result.suggestion)")
        }
        swiftCallOcFunc()
    }
    
    func swiftCallOcFunc(){
        MSPayRequest().swiftCallOcFunc()
        MSPayRequest.swiftCallOcClassFunc()
    }
}

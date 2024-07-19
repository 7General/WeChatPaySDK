

Pod::Spec.new do |s|
  s.name             = 'WeChatPaySDK'
  s.version = '2.0.1'
  s.summary          = ' MSWeChatPaySDK for weChatPay-SDK'
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  s.homepage         = 'https://github.com/7General'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanghuizhou21@163.com' => 'wanghuizhou@guazi.com' }
  s.source           = { :git => 'https://github.com/7General/WeChatPaySDK.git', :tag => s.version.to_s }
  
  
  s.ios.deployment_target = '12.0'
  
  s.source_files = 'WeChatPaySDK/Classes/**/*'
  s.static_framework = true
  s.dependency 'WechatOpenSDK'
  
  
end

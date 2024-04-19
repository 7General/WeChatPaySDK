

Pod::Spec.new do |s|
  s.name             = 'WeChatPaySDK'
  s.version          = '0.0.9'
  s.summary          = ' MSWeChatPaySDK for weChatPay-SDK'
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  s.homepage         = 'https://github.com/7General'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanghuizhou21@163.com' => 'wanghuizhou@guazi.com' }
  s.source           = { :git => 'https://github.com/7General/WeChatPaySDK.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  
  s.source_files = 'WeChatPaySDK/Classes/**/*.{h,swift,m}'
  s.resources = 'WeChatPaySDK/Assets/*', 'WeChatPaySDK/Classes/**/*.xib'
  s.frameworks = 'Security', 'CoreGraphics', 'WebKit', 'SystemConfiguration', 'CoreTelephony', 'QuartzCore', 'CoreText', 'UIKit', 'Foundation', 'CFNetwork', 'CoreMotion'
  s.libraries = 'c++', 'z'
  s.static_framework = true
  s.vendored_libraries = 'WeChatPaySDK/Classes/SDK/**/*.a'
  s.xcconfig = {
      'USER_HEADER_SEARCH_PATHS' => 'WeChatPaySDK/Classes/SDK/**/*.h',
      'OTHER_LDFLAGS' => '-ObjC'
  }
end

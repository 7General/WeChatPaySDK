

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
#  s.swift_version = '5.0'
  s.source_files = 'WeChatPaySDK/Classes/**/*.{h,m}'
  
  #s.resources = 'WeChatPaySDK/Assets/*', 'WeChatPaySDK/Classes/**/*.xib'
  s.frameworks = 'Security', 'CoreGraphics', 'WebKit', 'SystemConfiguration', 'CoreTelephony', 'QuartzCore', 'CoreText', 'UIKit', 'Foundation', 'CFNetwork', 'CoreMotion'
  s.libraries = 'c++', 'z'
  
  s.static_framework = true
  s.vendored_libraries = 'WeChatPaySDK/Frameworks/**/*.a'
  #调用pod lib lint --verbose --use-libraries时报了如下错误：
  #Ld .../Build/Intermediates.noindex/App.build/Release-iphonesimulator/App.build/Objects-normal/arm64/Binary/App normal arm64
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  
#  s.xcconfig = {
#    'USER_HEADER_SEARCH_PATHS' => 'WeChatPaySDK/Classes/SDK/**/*.h',
#    'OTHER_LDFLAGS' => '-ObjC'
#  }
  
end



Pod::Spec.new do |s|
  s.name             = 'WeChatPaySDK'
  s.version          = '0.0.1'
  s.summary          = 'A short description of WeChatPaySDK.'
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  s.homepage         = 'https://github.com/7General'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanghuizhou21@163.com' => 'wanghuizhou@guazi.com' }
  s.source           = { :git => 'https://github.com/7General/WeChatPaySDK.git', :tag => s.version.to_s }

  s.vendored_libraries = 'WeChatPaySDK/Frameworks/libWeChatSDK.a'
  s.libraries = 'z','c++','sqlite3.0'
  s.frameworks = 'UIKit', 'SystemConfiguration', 'Foundation', 'CoreTelephony', 'Security', 'CFNetwork'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WeChatPaySDK/Classes/**/*'

s.dependency 'AFNetworking'
end
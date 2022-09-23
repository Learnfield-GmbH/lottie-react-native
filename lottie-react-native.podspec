require 'json'

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package['version']
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = { :type => "Apache-2.0", :file => "LICENSE" }
  s.author      = { "author" => "leland.m.richardson@gmail.com" }
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '11.0'
  s.source       = { :git => "https://github.com/Learnfield-GmbH/lottie-react-native.git", :branch => "feature/lottieUpgrade" }
  s.source_files  = "ios/**/*.{h,m,swift}"
  s.swift_version = "5.0"

  s.dependency 'React-Core'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -framework Lottie',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]' => '$(inherited) ../../ios/Submodules/Wynton/Submodules/Dependencies/Frameworks/Lottie.xcframework/ios-arm64',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(inherited) ../../ios/Submodules/Wynton/Submodules/Dependencies/Frameworks/Lottie.xcframework/ios-arm64_i386_x86_64-simulator'
                           }
end

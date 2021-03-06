require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "lottie-react-native"
  s.version      = package['version']
  s.summary      = "Lottie component for React Native (iOS and Android)"
  
  s.authors      = { "intelligibabble" => "leland.m.richardson@gmail.com" }
  s.homepage     = "https://github.com/Learnfield-GmbH/lottie-react-native.git#readme"
  s.license      = package['license']
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/Learnfield-GmbH/lottie-react-native.git", :tag => "v#{s.version}" }
  s.source_files  = "src/ios/**/*.{h,m,swift}"
  s.swift_version = "5.0"
  s.dependency 'React'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -framework Lottie',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]' => '$(inherited) ../../ios/Submodules/Wynton/Submodules/Dependencies/Frameworks/XCode12.4/Lottie.xcframework/ios-arm64_armv7',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(inherited) ../../ios/Submodules/Wynton/Submodules/Dependencies/Frameworks/XCode12.4/Lottie.xcframework/ios-arm64_i386_x86_64-simulator'
                           }

end

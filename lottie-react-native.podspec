require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "lottie-react-native"
  s.version      = package['version']
  s.summary      = "Lottie component for React Native (iOS and Android)"
  
  s.authors      = { "intelligibabble" => "leland.m.richardson@gmail.com" }
  s.homepage     = "https://github.com/Learnfield-GmbH/lottie-react-native.git#readme"
  s.license      = package['license']
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '11.0'

  s.source       = { :git => "https://github.com/Learnfield-GmbH/lottie-react-native.git", :tag => "v#{s.version}" }
  s.source_files  = "src/ios/**/*.{h,m,swift}"

  s.swift_version = "5.0"
  s.dependency 'React'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = "5.0"
  s.dependency 'React-Core'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -framework Lottie',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]'        => '$(inherited) ../../dependencies/wyntonDependenciesPrecompiled/Frameworks/Lottie.xcframework/ios-arm64',
                            'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(inherited) ../../dependencies/wyntonDependenciesPrecompiled/Frameworks/Lottie.xcframework/ios-arm64_x86_64-simulator'
                           }

end

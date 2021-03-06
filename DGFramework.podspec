#
#  Be sure to run `pod spec lint DGFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "DGFramework"
  s.version      = "0.0.8"
  s.summary      = "Digicorp iOS framework for Swift 3.0+"
  s.homepage     = "http://www.digi-corp.com/"
  s.license      = "MIT"
  s.author       = { "Kevin B. Adesara" => "kevin.adesara@digi-corp.com" }

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/kevindigi/dg-ios-framework.git", :tag => "#{s.version}" }

  s.source_files  = 'DGFramework/DGFramework.h'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

  s.subspec 'Extension' do |ss|
    ss.source_files = 'DGFramework/extension'
  end

end

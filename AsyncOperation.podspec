#
# Be sure to run `pod lib lint AsyncOperation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AsyncOperation'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AsyncOperation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/llf1011341911/AsyncOperation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oauth2' => '101134191@qq.com.com' }
  s.source           = { :git => 'https://github.com/llf1011341911/AsyncOperation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'AsyncOperation/Classes/**/*'
end

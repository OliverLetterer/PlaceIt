#
# Be sure to run `pod lib lint PlaceIt.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PlaceIt"
  s.version          = "0.1.0"
  s.summary          = "Swiftly place your views."
  s.homepage         = "https://github.com/OliverLetterer/PlaceIt"
  s.screenshots      = "https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/screenshot-1.png", "https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/screenshot-2.png"
  s.license          = 'MIT'
  s.author           = { "Oliver Letterer" => "oliver.letterer@gmail.com" }
  s.source           = { :git => "https://github.com/OliverLetterer/PlaceIt.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/oletterer'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source'
  s.frameworks = 'UIKit', 'CoreGraphics'
end

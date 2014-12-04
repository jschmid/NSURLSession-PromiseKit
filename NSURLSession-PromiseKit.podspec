Pod::Spec.new do |s|
  s.name             = "NSURLSession-PromiseKit"
  s.version          = "0.1.0"
  s.summary          = "Adds a category to NSURLSession to be able to use PromiseKit."
#  s.description      = <<-DESC
#                       An optional longer description of NSURLSession-PromiseKit
#
#                       * Markdown format.
#                       * Don't worry about the indent, we strip it!
#                       DESC
  s.homepage         = "https://github.com/jschmid/NSURLSession-PromiseKit"
  s.license          = 'MIT'
  s.author           = { "Jonas Schmid" => "jonas.schmid@gmail.com" }
  s.source           = { :git => "https://github.com/jschmid/NSURLSession-PromiseKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jonas_schmid'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'NSURLSession-PromiseKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'PromiseKit/Promise', '~> 1.0'
end

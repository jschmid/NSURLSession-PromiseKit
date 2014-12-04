Pod::Spec.new do |s|
  s.name             = "NSURLSession-PromiseKit"
  s.version          = "0.2.1"
  s.summary          = "Adds a category to NSURLSession to be able to use PromiseKit."
  s.homepage         = "https://github.com/jschmid/NSURLSession-PromiseKit"
  s.license          = 'MIT'
  s.author           = { "Jonas Schmid" => "jonas.schmid@gmail.com" }
  s.source           = { :git => "https://github.com/jschmid/NSURLSession-PromiseKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jonas_schmid'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'Foundation'
  s.dependency 'PromiseKit/Promise', '~> 1.0'
end

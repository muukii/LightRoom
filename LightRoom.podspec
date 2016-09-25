
Pod::Spec.new do |s|
  s.name         = "LightRoom"
  s.version      = "0.9.9"
  s.summary      = "CoreImage Library"
  s.description  = "Easy Chaining ImageFilter with CoreImage."

  s.homepage     = "https://github.com/muukii/LightRoom"
  s.license      = "MIT"
  s.author             = { "muukii" => "m@muukii.me" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/muukii/LightRoom.git", :tag => s.version.to_s }
  s.source_files  = "LightRoom/Classes/**/*.swift"
  s.exclude_files = "Classes/Exclude"
  s.frameworks  = "Foundation"
end

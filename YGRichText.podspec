Pod::Spec.new do |spec|
  spec.name         = "YGRichText"
  spec.version      = "1.0.3"
  spec.summary      = "链式设置富文本"

  spec.description  = <<-DESC
    基于链式编程，点语法的简易调用设置富文本，达到自由灵活搭配。
    pod 'YGRichText'
                   DESC
                   
  spec.homepage     = "https://github.com/DaverZhou"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "DaverZhou" => "daverzhou98@gmail.com" }
  spec.source       = { :git => "https://github.com/DaverZhou/YGRichText.git", :tag => "#{spec.version}" }

  spec.ios.deployment_target = "8.0"

  spec.source_files        = "YGRichText/**/*"
  spec.public_header_files = "YGRichText/**/*.h"

  spec.requires_arc = true
  
  
end

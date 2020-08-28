Pod::Spec.new do |spec|
  spec.name         = "YGRichText"
  spec.version      = "1.0.1"
  spec.summary      = "rich Text"

  spec.description  = <<-DESC
    链式设置富文本
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

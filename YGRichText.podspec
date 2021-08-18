Pod::Spec.new do |spec|
  spec.name         = "YGRichText"
  spec.version      = "1.2.0"
  spec.summary      = "链式设置富文本"

  spec.description  = <<-DESC
    YGRichText：
    1、基于链式编程，点语法的简易调用设置富文本，达到自由灵活搭配。
    2、根据关键词计算获取字符串中的所有 range
    3、根据富文本获取文本大小
    4、根据固定宽度、字号获取可显示多少个字符
    
    支持：
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

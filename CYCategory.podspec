Pod::Spec.new do |s|
  s.name     = ‘CYCategory’ 
  s.version  = ‘0.0.2’ 
  s.license  = "MIT"  
  s.summary  = 'This is a countdown Category' 
  s.homepage = 'https://github.com/ezrealCheng/CYCategory'
  s.author   = { ‘程宜’ => 'ezreal_cheng@sina.com’ } 
  s.source   = { :git => 'https://github.com/ezrealCheng/CYCategory.git', :tag => “0.0.2” } //git路径、指定tag号
  s.platform = :ios 
  s.source_files = 'CYCategory/*'  
  s.framework = 'UIKit'  
  s.requires_arc = true
end
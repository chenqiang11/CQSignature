Pod::Spec.new do |s|
  s.name         = 'CQSignature'
  s.version      = '1.0.0'
  s.summary      = 'this is a signature'
  s.homepage     = 'https://github.com/chenqiang11/CQSignature.git'
  s.license      = 'MIT'
  
  s.author       = {'chenqiang' => '879752542@qq.com'}
 
 s.frameworks   = 'UIKit','CoreGraphics','Foundation','QuartzCore','CoreImage'

  s.source       = {:git => 'https://github.com/chenqiang11/CQSignature.git',  :commit => "23cbe63",:tag => '1.0.0'}
  s.source_files = "CQSignature/*.{h,m}"
  
  s.resources = ["image/*.png", "Sounds/*"]
   s.platform    = :ios, "9.0"

end
Pod::Spec.new do |s|
  s.name         = 'CQSignature'
  s.version      = '1.0.0'
  s.summary      = 'this is a signature'
  s.homepage     = 'https://github.com/chenqiang11/CQSignature.git'
  s.license      = 'MIT'
  
  s.author       = {'chenqiang' => '879752542@qq.com'}
  s.platform    = :ios
 s.frameworks   = 'UIKit','CoreGraphics','Foundation','QuartzCore','CoreImage'

  s.source       = {:git => 'https://github.com/chenqiang11/CQSignature.git', :tag => '1.0.0'}
  s.source_files = 'CQSignature/**/*.{h,m}'
   s.public_header_files = 'CQSignature/**/*.h'
 
  s.requires_arc = true
  

end
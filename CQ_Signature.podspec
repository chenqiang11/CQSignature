
Pod::Spec.new do |s|
  s.name         = 'CQ_Signature'
  s.version      = '1.0.0'
  s.summary      = 'this is a signature'
  s.homepage     = 'https://github.com/chenqiang11/CQSignature'
  s.license      = 'MIT'
  s.platform     = :ios
  s.author       = {'chenqiang' => '879752542@qq.com'}
  s.platform    = :ios
 

  s.source       = {:git => 'https://github.com/chenqiang11/CQSignature.git', :tag => '1.0.0'}
  s.source_files = 'CQ_Signature/CQSignature/*.{h,m}'
  

  s.requires_arc = true
  s.frameworks   = 'UIKit','CoreGraphics','Foundation'

end
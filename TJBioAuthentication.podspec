Pod::Spec.new do |s|
  s.name             = 'TJBioAuthentication'
  s.version          = '1.0.0'
  s.summary          = 'Apple bio metric authentication for touchID and faceID.'
 
  s.description      = 'Apple bio metric authentication for touchID and faceID. Now you can authenticate with Apple FaceID or TouchID'
 
  s.homepage         = 'https://github.com/tejas-ardeshna/TJBioAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tejas Ardeshna' => 'tejasardeshna@gmail.com' }
  s.source           = { :git => 'https://github.com/tejas-ardeshna/TJBioAuthentication.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tejas_ardeshna'
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'TJBioAuthentication/TJBioAuthentication/BioAuth/**/*'
 
end
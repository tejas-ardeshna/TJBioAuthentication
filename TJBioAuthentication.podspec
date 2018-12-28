Pod::Spec.new do |s|
  s.name             = 'TJBioAuthentication'
  s.version          = '1.2.0'
  s.summary          = 'Apple biometric authentication for Touch ID and Face ID.'
 
  s.description      = 'Apple biometric authentication for Touch ID and Face ID. Now you can authenticate with Apple Face ID or Touch ID'
 
  s.homepage         = 'https://github.com/tejas-ardeshna/TJBioAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tejas Ardeshna' => 'tejasardeshna@gmail.com' }
  s.source           = { :git => 'https://github.com/tejas-ardeshna/TJBioAuthentication.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tejas_ardeshna'
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'TJBioAuthentication/TJBioAuthentication/BioAuth/**/*'
 
end

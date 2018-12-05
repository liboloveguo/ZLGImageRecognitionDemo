Pod::Spec.new do |s|
    s.name             = 'ZLGImageRecognizeSDK'
    s.version          = '0.0.1'
    s.summary           = 'ZLGImageRecognizeSDK ceshi shiyong'
    s.homepage         = 'https://github.com/liboloveguo/ZLGImageRecognitionDemo'
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'liboloveguo' => 'ag970898664@163.com' }
    s.source           = { :git => 'https://github.com/liboloveguo/ZLGImageRecognitionDemo.git', :tag => s.version.to_s }
    
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'ZLGImageRecognizeSDK/Classes/*.{h,m}'
    s.vendored_frameworks = 'ZLGImageRecognizeSDK/Classes/framework/*.{framework}'
    
end

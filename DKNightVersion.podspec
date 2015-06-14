Pod::Spec.new do |s|
  s.name         = "DKNightVersion"
  s.version      = "0.8.1"
  s.summary      = "DKNightVersion is a lightweight iOS framework adding night mode to your iOS app."
  s.description  = <<-DESC
                   DKNightVersion is a light weight framework. It is mainly built through `objc/runtime` library and reflection, providing a neat approach  adding night mode to your iOS app. A great many codes of this framework is automatically generated by Ruby script.

                   The most delightful feature of DKNightVersion is that it appends one more property `nightColor` to frequently-used UIKit components and provides you a default night mode theme. It is easily-used and well-designed. Hope you have a great joy to use DKNightVersion to integrate night mode in your Apps.
                    DESC
  s.homepage     = "https://github.com/Draveness/DKNightVersion"
  s.license      = "MIT"
  s.author             = { "Draveness" => "stark.draven@gmail.com" }
  s.platform     = :ios, "6.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/Draveness/DKNightVersion.git", :tag => s.version }
  s.source_files = "Classes/DKNightVersion.h"
  s.resources = "Rakefile", 'property.json', 'Gemfile'

  s.subspec 'Core' do |ss|
    ss.source_files = "Classes/Core/*.{h,m}"
  end

  s.subspec 'Controller' do |ss|
    ss.source_files = "Classes/Controller/*.{h,m}"
    ss.dependency 'DKNightVersion/Core'
    ss.dependency 'DKNightVersion/UIKit'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = "Classes/UIKit/**/*.{h,m}"
    ss.dependency 'DKNightVersion/Core'
    ss.dependency 'DKNightVersion/Helper'
  end
  
  s.subspec 'Helper' do |ss|
    ss.source_files = "Classes/Helper/*.{h,m}"
    ss.dependency 'DKNightVersion/Core'
  end
  
  s.subspec 'Generator' do |ss|
    ss.resources = "generator/**"
  end

end

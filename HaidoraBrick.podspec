Pod::Spec.new do |s|
  s.name             = "HaidoraBrick"
  s.version          = "0.0.1"
  s.summary          = "HaidoraBrick."
  s.description      = <<-DESC
                        a simple mvvm fork from (https://github.com/leichunfeng/MVVMReactiveCocoa)
                       DESC

  s.homepage         = "https://github.com/Haidora/HaidoraBrick"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraBrick.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'Core' do |core|
      core.source_files = 'Pod/Classes/*.h','Pod/Classes/Core/**/*{h,m}'
  end
  s.subspec 'Extension' do |extension|
      extension.dependency 'HaidoraBrick/Core'
      extension.source_files = 'Pod/Classes/Extension/*.h'
      extension.subspec 'Navigation' do |extension_Navigation|
          extension_Navigation.source_files = 'Pod/Classes/Extension/Navigation/**/*{h,m}'
      end
  end
end


platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!


target 'challengebci' do
  pod 'Kingfisher'
  pod 'MBProgressHUD'
  pod 'SwiftyJSON'
  pod 'RealmSwift', '~> 3.19.0'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end

target 'KIFTests' do
  pod 'KIF', :configurations => ['Debug']
  pod 'KIF/IdentifierTests', :configurations => ['Debug']
end

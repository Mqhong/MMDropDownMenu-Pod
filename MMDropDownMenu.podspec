Pod::Spec.new do |s|
s.name = 'MMDropDownMenu'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = 'A DropDownMenu view on iOS.'
s.homepage = 'https://github.com/Mqhong/MMDropDownMenu'
s.author = { "Mqhong" => "617257112@qq.com" }
s.source = { :git => 'https://github.com/Mqhong/MMDropDownMenu.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.1'
s.source_files = 'Pod/Classes/*.{h,m}'
s.frameworks = 'UIKit'
s.resource_bundles = {
'MMDropDownView' => ['Pod/Assets/*.png']
}
end

Pod::Spec.new do |spec|

  spec.name         = "XCalcWrapper"
  spec.version      = "0.0.6"
  spec.summary      = "A small library written for xcalc"
  spec.description  = <<-DESC
                      Small iOS wrapper for xcalc library, which provides convenient interface to xcalc arithmetic expressions processor
                   DESC
  spec.homepage     = "https://github.com/st235/xcalc-ios-wrapper"
  spec.license      = "MIT"
  spec.author             = { "Alexander Dadukin" => "hi@st235.xyz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/st235/xcalc-ios-wrapper.git", :tag => "#{spec.version}" }
  spec.private_header_files = "Headers/*.{h}"
  spec.source_files  = "Headers/*.{h}", "XCalcWrapper/**/*.{swift,h,mm}"
  spec.swift_version = "5.0"
  spec.vendored_libraries = 'Versions/libxcalc_core.a'

  spec.frameworks = 'Foundation'
  spec.libraries = 'c++'

  spec.pod_target_xcconfig = { 
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/Headers"',
  }

end

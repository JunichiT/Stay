Pod::Spec.new do |s|
  s.name          = "Stay"
  s.version       = "0.1.0"
  s.summary       = "A Library that Help Measure Screen Stay Duration of ViewController."
  s.description   = <<-DESC
  This library helps measure screen stay duration of ViewController.
                   DESC
  s.homepage      = "https://github.com/JunichiT/Stay"
  s.license       = "MIT"
  s.author        = { "Junichi Tsurukawa" => "j.tsurukawa@gmail.com" }
  s.platform      = :ios, "10.0"
  s.source        = { :git => "git@github.com:JunichiT/Stay.git", :tag => "#{s.version}" }
  s.requires_arc  = true
  s.swift_version = '4.0'
  s.source_files  = "Sources/*.{h,swift}"
end


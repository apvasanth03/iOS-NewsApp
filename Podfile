# Global config
platform :ios, '10.0'
use_frameworks!
workspace 'NewsApp.xcworkspace'

# Methods to ensure the same version of each library is used across targets

def commonPods
    pod 'RxSwift',    '~> 4.0'
end

# Targets

# App
target 'NewsApp' do
    project 'NewsApp.xcodeproj'
    commonPods
end

# Domain
target 'Domain' do
    project 'Domain/Domain.xcodeproj'
    commonPods
end


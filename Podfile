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
    
    pod 'RxCocoa',    '~> 4.0'
    pod 'SDWebImage', '~> 5.0'
end

# Domain
target 'Domain' do
    project 'Domain/Domain.xcodeproj'
    commonPods
end

# Data
target 'Data' do
    project 'Data/Data.xcodeproj'
    commonPods
end

# Remote
target 'Remote' do
    project 'Remote/Remote.xcodeproj'
    commonPods
end

# Presentation
target 'Presentation' do
    project 'Presentation/Presentation.xcodeproj'
    commonPods
end


# Global config
platform :ios, '10.0'
use_frameworks!
workspace 'NewsApp.xcworkspace'

# Methods to ensure the same version of each library is used across targets

def commonPods
    pod 'RxSwift',    '~> 4.0'
end

def commonTestPods
    pod 'RxTest', '~> 4.0'
    pod 'RxBlocking', '~> 4.0'
    pod 'Cuckoo', '~> 1.0'
end

# Targets

# App
target 'NewsApp' do
    project 'NewsApp.xcodeproj'
    commonPods
    
    pod 'RxCocoa',    '~> 4.0'
    pod 'SDWebImage', '~> 5.0'
    pod 'Swinject',   '~> 2.6'
    
end

# Domain
target 'Domain' do
    project 'Domain/Domain.xcodeproj'
    commonPods
    
    target 'DomainTests' do
        inherit! :search_paths
        commonTestPods
    end
end

# Data
target 'Data' do
    project 'Data/Data.xcodeproj'
    commonPods
    
    target 'DataTests' do
        inherit! :search_paths
        commonTestPods
    end
end

# Remote
target 'Remote' do
    project 'Remote/Remote.xcodeproj'
    commonPods
    
    target 'RemoteTests' do
        inherit! :search_paths
        commonTestPods
    end
end

# Presentation
target 'Presentation' do
    project 'Presentation/Presentation.xcodeproj'
    commonPods
end


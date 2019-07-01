//
//  FontStyle.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 28/06/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import UIKit

/**
 A Class provides Default Font Style for our application.
 
 Refer - https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
 */
enum Font{
    
    case largeTitle
    case title1
    case title2
    case title3
    
    case headline
    case body
    case callout
    case subHeadline
    case footnote
    case caption1
    case caption2
}

extension Font{
    
    var value: UIFont{
        var instanceFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
        
        switch self{
            
        case .largeTitle:
            instanceFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title1:
            instanceFont = UIFont.preferredFont(forTextStyle: .title1)
        case .title2:
            instanceFont = UIFont.preferredFont(forTextStyle: .title2)
        case .title3:
            instanceFont = UIFont.preferredFont(forTextStyle: .title3)
            
        case .headline:
            instanceFont = UIFont.preferredFont(forTextStyle: .headline)
        case .body:
            instanceFont = UIFont.preferredFont(forTextStyle: .body)
        case .callout:
            instanceFont = UIFont.preferredFont(forTextStyle: .callout)
        case .subHeadline:
            instanceFont = UIFont.preferredFont(forTextStyle: .subheadline)
        case .footnote:
            instanceFont = UIFont.preferredFont(forTextStyle: .footnote)
        case .caption1:
            instanceFont = UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2:
            instanceFont = UIFont.preferredFont(forTextStyle: .caption2)
            
        }
        
        return instanceFont
    }
    
}

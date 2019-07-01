//
//  Color.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 28/06/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import UIKit

/**
 A Class provides color palette for our application.
 */
enum Color{
    
    case theme
    case border
    case shadow
    
    case navigationTitleText
    
    case background
    
    case darkText
    case intermidiateText
    case lightText
    
    case custom(hexString: String, alpha: Double)
    
    // Add transparency to an existing colour.
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .theme:
            instanceColor = UIColor(hexString: "#008577")
        case .border:
            instanceColor = UIColor(hexString: "#333333")
        case .shadow:
            instanceColor = UIColor(hexString: "#CCCCCC")
        
        case .navigationTitleText:
            instanceColor = UIColor(hexString: "#FFFFFF")
            
        case .background:
            instanceColor = UIColor(hexString: "#FFFFFF")
            
        case .darkText:
            instanceColor = UIColor(hexString: "#333333")
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#999999")
        case .lightText:
            instanceColor = UIColor(hexString: "#CCCCCC")
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}

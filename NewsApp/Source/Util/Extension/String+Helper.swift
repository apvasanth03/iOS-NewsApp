//
//  String+Helper.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 27/06/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
 String Extension functions.
 */
extension String{
    
    /// Get localized string.
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}

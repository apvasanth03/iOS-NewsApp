//
//  Mapper.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 09/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
 Interface defines generic method for mapping "Domain model" to "UI model"
 */
public protocol Mapper{
    
    associatedtype Domain
    associatedtype UI
    
    func mapToUI(domain: Domain)-> UI
    
}

//
//  ModelMapper.swift
//  Remote
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
    Interface defines generic method for mapping "remote model" to "data model"
 */
protocol ModelMapper{
    
    associatedtype Model
    associatedtype Entity
    
    func mapFromModel(model: Model)-> Entity
    
}

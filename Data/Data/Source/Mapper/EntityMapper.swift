//
//  EntityMapper.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
    Interface defines generic method for mapping "data model" to "domain model"
 */

public protocol EntityMapper {
    
    associatedtype Entity
    associatedtype Domain
    
    func mapFromEntity(entity: Entity)-> Domain
}

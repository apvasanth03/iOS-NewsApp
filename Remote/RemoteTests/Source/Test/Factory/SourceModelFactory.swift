//
//  SourceModelFactory.swift
//  RemoteTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
@testable import Remote


/**
 Factory generates SourceModel with random data.
 */
class SourceModelFactory{
    
    static func makeSourceModel()-> SourceModel{
        return SourceModel(id: randomString(),
                           name: randomString())
    }
    
}

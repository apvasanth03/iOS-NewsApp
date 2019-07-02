//
//  SourceModel.swift
//  Remote
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

struct SourceModel: Codable{
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}

//
//  DataAssembly.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 01/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Data
import Domain
import Swinject

/**
 A Assembly - registers all Data module dependencies.
 */
class DataAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(NewsArticleEntityMapper.self){ _ in
            NewsArticleEntityMapper()
            }
            .inObjectScope(.container)
        
        container.register(NewsArticlesRepository.self){ r in
            let remoteDataStore = r.resolve(NewsArticleRemoteDataStore.self)!
            let mapper = r.resolve(NewsArticleEntityMapper.self)!
            
            return NewsArticleDataRepository(remoteDataStore: remoteDataStore, mapper: mapper)
            }
            .inObjectScope(.container)
    }
    
}

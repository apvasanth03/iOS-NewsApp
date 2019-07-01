//
//  RemoteAssembly.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 01/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import HttpClient
import Remote
import Data
import Swinject


/**
 A Assembly - registers all Remote module dependencies.
 */
class RemoteAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(NewsArticleModelMapper.self){ _ in
            NewsArticleModelMapper()
            }
            .inObjectScope(.container)
        
        container.register(NewsArticleRemoteDataStore.self){ r in
            let httpClient = r.resolve(HttpClient.self)!
            let mapper = r.resolve(NewsArticleModelMapper.self)!
            
            return NewsArticleRemoteDataStoreImpl(httpClient: httpClient, mapper: mapper)
            }
            .inObjectScope(.container)
    }
    
}

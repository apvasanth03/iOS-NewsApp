//
//  DomainAssembly.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 01/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Domain
import Swinject

/**
 A Assembly - registers all Domain module dependencies.
 */
class DomainAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(GetNewsArticlesUseCase.self){ r in
            let newsArticlesRepository = r.resolve(NewsArticlesRepository.self)!
            
            return GetNewsArticlesUseCase(newsArticlesRepository: newsArticlesRepository)
            }
            .inObjectScope(.container)
    }
    
}

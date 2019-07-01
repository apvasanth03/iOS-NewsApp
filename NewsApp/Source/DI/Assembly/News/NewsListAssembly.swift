//
//  NewsListAssembler.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 01/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Swinject
import Domain
import Presentation

/**
 A Assembly - registers all dependecies for NewsList screen.
 */
class NewsListAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(NewsArticleUIMapper.self){ _ in
            NewsArticleUIMapper()
            }
            .inObjectScope(.container)
        
        container.register(NewsListViewModel.self){ r in
            let getNewsArticleUseCase = r.resolve(GetNewsArticlesUseCase.self)!
            let mapper = r.resolve(NewsArticleUIMapper.self)!
            
            return NewsListViewModel(getNewsArticleUseCase: getNewsArticleUseCase, mapper: mapper)
            }
            .inObjectScope(.container)
    }
    
}

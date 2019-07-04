//
//  GetNewsArticlesUseCase.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift

/**
 1. The useCase responsible for getting NewsArticles.
 2. open - We have made the class open because it needs to be extented in other module for unit testing (Mock using Cuckoo lib).
 */
open class GetNewsArticlesUseCase {
    
    // MARK: - Properties.
    private let newsArticlesRepository: NewsArticlesRepository
    
    // MARK: - Init.
    public init(newsArticlesRepository: NewsArticlesRepository) {
        self.newsArticlesRepository = newsArticlesRepository
    }
    
    // MARK: Public Methods.
    open func execute() -> Single<[NewsArticle]>{
        return newsArticlesRepository.getNewsArticles()
    }
    
}

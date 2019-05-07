//
//  GetNewsArticlesUseCase.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift

//
// The useCase responsible for getting NewsArticles.
//
public class GetNewsArticlesUseCase {
    
    // MARK: - Properties.
    private let newsArticlesRepository: NewsArticlesRepository
    
    // MARK: - Init.
    init(newsArticlesRepository: NewsArticlesRepository) {
        self.newsArticlesRepository = newsArticlesRepository
    }
    
    // MARK: Public Methods.
    public func execute() -> Single<[NewsArticle]>{
        return newsArticlesRepository.getNewsArticles()
    }
    
}

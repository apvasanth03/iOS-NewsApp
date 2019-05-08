//
//  NewsArticleDataRepository.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift
import Domain

/**
    A Class provides implementation for NewsArticlesRepository.
 */
public class NewsArticleDataRepository: NewsArticlesRepository{
    
    // MARK: Properties.
    private let remoteDataStore: NewsArticleRemoteDataStore
    private let mapper: NewsArticleEntityMapper
    
    // MARK: Init.
    public init(remoteDataStore: NewsArticleRemoteDataStore, mapper: NewsArticleEntityMapper) {
        self.remoteDataStore = remoteDataStore
        self.mapper = mapper
    }
    
    // MARK: NewsArticlesRepository Methods.
    public func getNewsArticles() -> Single<[NewsArticle]> {
        return remoteDataStore.getNewsArticles()
            .map{ entities in
                entities.map{
                    self.mapper.mapFromEntity(entity: $0)
                }
        }
    }
}

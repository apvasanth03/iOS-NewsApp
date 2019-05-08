//
//  NewsArticleRemoteDataStoreImpl.swift
//  Remote
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import HttpClient
import Data
import RxSwift

/**
    A Class provides implementation for NewsArticleRemoteDataStore.
 */
public class NewsArticleRemoteDataStoreImpl: NewsArticleRemoteDataStore{
    
    // MARK: Properties.
    private let httpClient: HttpClient
    private let mapper: NewsArticleModelMapper
    
    private let NEWS_API_KEY = "d6c6c7358b70483a8625ab5aef41d5f3"
    private let GET_NEWS_ARTICLES_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$NEWS_API_KEY"
    
    // MARK: Initializer.
    public init(httpClient: HttpClient, mapper: NewsArticleModelMapper){
        self.httpClient = httpClient
        self.mapper = mapper
    }
    
    // MARK: NewsArticleDataRepository.
    public func getNewsArticles() -> Single<[NewsArticleEntity]> {
        return Single.create{ observer in
            self.httpClient.getRequest(for: self.GET_NEWS_ARTICLES_URL, with: nil, parseTo: NewsArticleResponseModel.self, successHandler: { response in
                let newsArticleEntitles = response.articles.map{self.mapper.mapFromModel(model: $0)}
                observer(SingleEvent.success(newsArticleEntitles))
            }, errorhandler: { error in
                observer(SingleEvent.error(error))
            })
            return Disposables.create()
        }
    }
}

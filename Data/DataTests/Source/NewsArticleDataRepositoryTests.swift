//
//  NewsArticleDataRepositoryTests.swift
//  DataTests
//
//  Created by Vasanthakumar Annadurai on 03/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
@testable import Data
@testable import Domain
import Cuckoo
import RxSwift
import RxBlocking

/**
 A Class containes Test cases for "NewsArticleDataRepository" class.
 */
class NewsArticleDataRepositoryTests: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var newsArticleDataRepository: NewsArticleDataRepository!
    
    // Mocks
    fileprivate var mockNewsArticleRemoteDataStore: MockNewsArticleRemoteDataStore!
    fileprivate var mockNewsArticleEntityMapper: MockNewsArticleEntityMapper!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        mockNewsArticleRemoteDataStore = MockNewsArticleRemoteDataStore()
        mockNewsArticleEntityMapper = MockNewsArticleEntityMapper()
        
        newsArticleDataRepository = NewsArticleDataRepository(remoteDataStore: mockNewsArticleRemoteDataStore, mapper: mockNewsArticleEntityMapper)
    }
    
    // MARK: - Test Methods.
    func test_GetNewsArticles_ShouldGetFromRemoteSourceAndMapItToDomain() throws{
        let newsArticleEntity = NewsArticleEntityFactory.makeNewsArticleEntity()
        let newsArticle = NewsArticleFactory.makeNewsArticle()
        stub(mockNewsArticleEntityMapper){ stub in
            when(stub.mapFromEntity(entity: equal(to: newsArticleEntity))).thenReturn(newsArticle)
        }
        stub(mockNewsArticleRemoteDataStore){ stub in
            when(stub.getNewsArticles()).thenReturn(Single.just([newsArticleEntity]))
        }
        
        let newsArticlesResponse = try newsArticleDataRepository.getNewsArticles()
            .toBlocking().single()
        
        verify(mockNewsArticleRemoteDataStore).getNewsArticles()
        verify(mockNewsArticleEntityMapper).mapFromEntity(entity: equal(to: newsArticleEntity))
        XCTAssertEqual(newsArticlesResponse, [newsArticle])
    }
    
}

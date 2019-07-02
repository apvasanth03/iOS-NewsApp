//
//  GetNewsArticlesUseCaseTest.swift
//  DomainTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
import Domain
import Cuckoo
import RxSwift
import RxBlocking

/**
 A Class containes Test cases for GetNewsArticleUseCase class.
 */
class GetNewsArticleUseCaseTests: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var getNewsArticleUseCase: GetNewsArticlesUseCase!
    
    // Mocks
    fileprivate var mockNewsArticlesRepository: MockNewsArticlesRepository!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        mockNewsArticlesRepository = MockNewsArticlesRepository()
        getNewsArticleUseCase = GetNewsArticlesUseCase(newsArticlesRepository: mockNewsArticlesRepository)
    }
    
    // MARK: - Test Methods.
    func test_GetNewsArticles_ShouldCallRepository(){
        let newsArticlesStubResponse = [NewsArticleFactory.makeNewsArticle()]
        stub(mockNewsArticlesRepository){ stub in
            when(stub.getNewsArticles()).thenReturn(Single.just(newsArticlesStubResponse))
        }
        
        let _ = getNewsArticleUseCase.execute()
            .toBlocking()
        
        verify(mockNewsArticlesRepository).getNewsArticles()
    }
    
    func test_getNewsArticles_ShouldReturnDataFromRepository() throws{
        let newsArticlesStubResponse = [NewsArticleFactory.makeNewsArticle()]
        stub(mockNewsArticlesRepository){ stub in
            when(stub.getNewsArticles()).thenReturn(Single.just(newsArticlesStubResponse))
        }
        
        let newsArticlesResponse = try getNewsArticleUseCase.execute()
            .toBlocking()
            .single()
        
        XCTAssertEqual(newsArticlesResponse, newsArticlesStubResponse)
    }
    
    
}

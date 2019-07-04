//
//  NewsArticleUIMapperTests.swift
//  PresentationTests
//
//  Created by Vasanthakumar Annadurai on 03/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
@testable import Presentation
@testable import Domain

/**
 A Class containes Test cases for "NewsArticleUIMapper" class.
 */
class NewsArticleUIMapperTests: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var newsArticleUIMapper: NewsArticleUIMapper!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        newsArticleUIMapper = NewsArticleUIMapper()
    }
    
    // MARK: - Test Methods.
    func test_MapToView_givenCorrectDomainModel_shouldParseCorrectUIModel(){
        let domainModel = NewsArticleFactory.makeNewsArticle()
        
        let uiModel = newsArticleUIMapper.mapToUI(domain: domainModel)
        
        XCTAssertEqual(uiModel.title, domainModel.title)
        XCTAssertEqual(uiModel.source, domainModel.source)
        XCTAssertEqual(uiModel.url, domainModel.url)
        XCTAssertEqual(uiModel.urlToImage, domainModel.urlToImage)
    }
}

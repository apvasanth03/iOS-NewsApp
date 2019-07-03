//
//  NewsArticleEntityMapperTests.swift
//  DataTests
//
//  Created by Vasanthakumar Annadurai on 03/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
@testable import Data
@testable import Domain

/**
 A Class containes Test cases for NewsArticleEntityMapper class.
 */
class NewsArticleEntityMapperTests: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var newsArticleEntityMapper: NewsArticleEntityMapper!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        newsArticleEntityMapper = NewsArticleEntityMapper()
    }
    
    // MARK: - Test Methods.
    func test_mapFromEntity_GivenCorrectEntityModel_ShouldParseCorrectDomainModel(){
        let entity = NewsArticleEntityFactory.makeNewsArticleEntity()
        
        let domain = newsArticleEntityMapper.mapFromEntity(entity: entity)
        
        XCTAssertEqual(domain.title, entity.title)
        XCTAssertEqual(domain.description, entity.description)
        XCTAssertEqual(domain.author, entity.author)
        XCTAssertEqual(domain.source, entity.source)
        XCTAssertEqual(domain.publishedAt, entity.publishedAt)
        XCTAssertEqual(domain.url, entity.url)
        XCTAssertEqual(domain.urlToImage, entity.urlToImage)
    }
    
    
}

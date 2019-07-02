//
//  NewsArticleResponseModelTests.swift
//  RemoteTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
@testable import Remote
@testable import Data

/**
 A Class containes Test cases for NewsArticleResponseModel class.
 */
class NewsArticleResponseModelTests: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var newsArticleModelMapper: NewsArticleModelMapper!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        newsArticleModelMapper = NewsArticleModelMapper()
    }
    
    // MARK: - Test Methods.
    func test_mapFromModel_GivenCorrectModel_ShouldParseCorrectEntity(){
        let model = NewsArticleModelFactory.makeNewsArticleModel()
        
        let entity = newsArticleModelMapper.mapFromModel(model: model)
        
        XCTAssertEqual(entity.title, model.title)
        XCTAssertEqual(entity.description, model.description)
        XCTAssertEqual(entity.author, model.author)
        XCTAssertEqual(entity.source, model.source.name)
        XCTAssertEqual(entity.url, model.url)
        XCTAssertEqual(entity.urlToImage, model.urlToImage)
    }
    
}

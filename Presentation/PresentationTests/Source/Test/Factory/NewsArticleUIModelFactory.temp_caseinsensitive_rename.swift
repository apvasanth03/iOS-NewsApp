//
//  NewsArticleUiModelFactory.swift
//  PresentationTests
//
//  Created by Vasanthakumar Annadurai on 03/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
@testable import Presentation

/**
 Factory generates "NewsArticleUIModel" with random data.
 */
class NewsArticleFactory{
    
    static func makeNewsArticle()-> NewsArticle{
        return NewsArticle(title: randomString(),
                           description: randomString(),
                           author: randomString(),
                           source: randomString(),
                           publishedAt: randomDate(),
                           url: randomString(),
                           urlToImage: randomString())
    }
    
}

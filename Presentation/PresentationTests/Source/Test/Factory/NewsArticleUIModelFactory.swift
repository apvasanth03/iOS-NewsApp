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
class NewsArticleUIModelFactory{
    
    static func makeNewsArticleUIModel()-> NewsArticleUIModel{
        return NewsArticleUIModel(title: randomString(),
                                  source: randomString(),
                                  publishedAt: randomString(),
                                  url: randomString(),
                                  urlToImage: randomString())
    }
    
}

//
//  NewsArticleEntityFactory.swift
//  DataTests
//
//  Created by Vasanthakumar Annadurai on 03/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
@testable import Data

/**
 Factory generates NewsArticleEntity with random data.
 */
class NewsArticleEntityFactory{
    
    static func makeNewsArticleEntity()-> NewsArticleEntity{
        return NewsArticleEntity(title: randomString(),
                                 description: randomString(),
                                 author: randomString(),
                                 source: randomString(),
                                 publishedAt: randomDate(),
                                 url: randomString(),
                                 urlToImage: randomString())
    }
    
}

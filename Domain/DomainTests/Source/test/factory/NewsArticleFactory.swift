//
//  NewsArticleFactory.swift
//  DomainTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Domain

/**
 Factory generates NewsArticle with random data.
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

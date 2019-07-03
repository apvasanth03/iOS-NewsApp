//
//  NewsArticleModelFactory.swift
//  RemoteTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
@testable import Remote

/**
 Factory generates NewsArticleModel with random data.
 */
class NewsArticleModelFactory{
    
    static func makeNewsArticleModel()-> NewsArticleModel{
        return NewsArticleModel(source: SourceModelFactory.makeSourceModel(),
                                author: randomString(),
                                title: randomString(),
                                description: randomString(),
                                url: randomString(),
                                urlToImage: randomString(),
                                publishedAt: randomString(),
                                content: randomString())
    }
    
}

//
//  NewsArticle.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

public struct NewsArticle {
    public let title: String
    public let description: String?
    public let author: String?
    public let source: String
    public let publishedAt: Date
    public let url: String
    public let urlToImage: String?
    
    public init(title: String, description: String?, author: String?,
                source: String, publishedAt: Date, url: String, urlToImage: String?){
        self.title = title
        self.description = description
        self.author = author
        self.source = source
        self.publishedAt = publishedAt
        self.url = url
        self.urlToImage = urlToImage
    }
}

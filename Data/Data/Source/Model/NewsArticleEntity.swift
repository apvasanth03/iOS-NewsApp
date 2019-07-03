//
//  NewsArticleEntity.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

public struct NewsArticleEntity: Equatable{
    let title: String
    let description: String?
    let author: String?
    let source: String
    let publishedAt: Date
    let url: String
    let urlToImage: String?
    
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

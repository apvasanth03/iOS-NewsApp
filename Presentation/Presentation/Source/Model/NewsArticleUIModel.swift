//
//  NewsArticleUIModel.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 09/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

public struct NewsArticleUIModel{
    
    public let title: String
    public let source: String
    public let publishedAt: String
    public let url: String
    public let urlToImage: String?
    
    public init(title: String, source: String, publishedAt: String, url: String, urlToImage: String?){
        self.title = title
        self.source = source
        self.publishedAt = publishedAt
        self.url = url
        self.urlToImage = urlToImage
    }
}

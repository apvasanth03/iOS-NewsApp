//
//  NewsArticleUIMapper.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 09/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Domain

public class NewsArticleUIMapper: Mapper{
    
    // MARK: EntityMapper Protocol AssociatedType.
    public typealias Domain = NewsArticle
    public typealias UI = NewsArticleUIModel
    
    // MARK: Properties.
    lazy var publishedAtDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter
    }()
    
    // MARK: Initializer.
    public init(){
        
    }
    
    // MARK: Mapper Methods.
    public func mapToUI(domain: NewsArticle) -> NewsArticleUIModel {
        let publishedAtDisplayDate = publishedAtDateFormatter.string(from: domain.publishedAt)
        return NewsArticleUIModel(title: domain.title, source: domain.source, publishedAt: publishedAtDisplayDate, url: domain.url, urlToImage: domain.urlToImage)
    }
    
    
}

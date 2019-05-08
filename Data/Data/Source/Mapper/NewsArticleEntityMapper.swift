//
//  NewsArticleEntityMapper.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Domain

public class NewsArticleEntityMapper: EntityMapper{
    
    // MARK: EntityMapper Protocol AssociatedType.
    public typealias Entity = NewsArticleEntity
    public typealias Domain = NewsArticle
    
    // MARK: Initializer.
    public init(){
        
    }
    
    // MARK: EntityMapper Methods.
    public func mapFromEntity(entity: NewsArticleEntity) -> NewsArticle {
        return NewsArticle(title: entity.title,
                           description: entity.description,
                           author: entity.author,
                           source: entity.source,
                           publishedAt: entity.publishedAt,
                           url: entity.url,
                           urlToImage: entity.urlToImage)
    }
}

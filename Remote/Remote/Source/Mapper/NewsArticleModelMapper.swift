//
//  NewsArticleModelMapper.swift
//  Remote
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Data

public class NewsArticleModelMapper: ModelMapper{
    
    // MARK: EntityMapper Protocol AssociatedType.
    typealias Model = NewsArticleModel
    typealias Entity = NewsArticleEntity
    
    // MARK: Initializer.
    public init(){
        
    }
    
    // MARK: Properties.
    lazy var dataFormatter = ISO8601DateFormatter()

    // MARK: ModelMapper Methods.
    func mapFromModel(model: NewsArticleModel) -> NewsArticleEntity {
        let publishedAtDate = dataFormatter.date(from: model.publishedAt) ?? Date()
        
        return NewsArticleEntity(title: model.title, description: model.description, author: model.author, source: model.source.name, publishedAt: publishedAtDate, url: model.url, urlToImage: model.urlToImage)
    }
}

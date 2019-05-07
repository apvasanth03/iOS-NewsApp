//
//  NewsArticlesRepository.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift

//
// The interface provides abstraction over data layer.
//
public protocol NewsArticlesRepository {
    
    func getNewsArticles() -> Single<[NewsArticle]>
    
}

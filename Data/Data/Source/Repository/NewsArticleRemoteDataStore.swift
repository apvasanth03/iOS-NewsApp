//
//  NewsArticleRemoteDataStore.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift

/**
   The interface provides abstraction over remote layer.
 */
public protocol NewsArticleRemoteDataStore {
    
    func getNewsArticles() -> Single<[NewsArticleEntity]>
    
}

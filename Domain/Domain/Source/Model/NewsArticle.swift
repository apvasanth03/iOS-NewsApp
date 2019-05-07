//
//  NewsArticle.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

public struct NewsArticle {
    let title: String
    let description: String
    let author: String?
    let source: String
    let publishedAt: Date
    let url: String
    let urlToImage: String
}

//
//  HttpClientAssembly.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 01/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Swinject
import HttpClient

/**
 A Assembly - registers all HttpClient module dependencies.
 */
class HttpClientAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(HttpClient.self){ _ in
            UrlSessionHttpClient()
            }
            .inObjectScope(.container)
    }
    
}

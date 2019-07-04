//
//  AppAssembly.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 04/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Swinject
import Presentation

/**
 A Assembly - registers all our Application level dependencies.
 */
class AppAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(SchedulerProvider.self){ r in
            return AppSchedulerProvider()
            }
            .inObjectScope(.container)
    }
    
}

//
//  AppSchedulerProvider.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 04/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import Presentation
import RxSwift

/**
 A Class provides "SchedulerProvider" implementation for our application.
 */
class AppSchedulerProvider: SchedulerProvider{
    
    func uiScheduler() -> ImmediateSchedulerType {
        return MainScheduler.instance
    }
    
    func backgroundScheduler() -> ImmediateSchedulerType {
        return ConcurrentDispatchQueueScheduler(queue:
            DispatchQueue.global())
    }
    
}

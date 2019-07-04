//
//  SchedulerProvider.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 04/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift

/**
 1. A Protocol abstracts the actual scheduler used for running the task.
 2. Which helps us in unit testing.
 */
public protocol SchedulerProvider {
    
    func uiScheduler()-> ImmediateSchedulerType
    
    func backgroundScheduler()-> ImmediateSchedulerType
    
}

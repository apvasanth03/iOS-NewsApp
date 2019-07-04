//
//  TestSchedulerProvider.swift
//  PresentationTests
//
//  Created by Vasanthakumar Annadurai on 04/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift
@testable import Presentation

/**
 1. A Class provides "SchedulerProvider" implementation for our Testapplication.
 2. We use CurrentThreadScheduler - Hence all our operation runs in same thread serially.
 */
class TestSchedulerProvider: SchedulerProvider{
    
    func uiScheduler() -> ImmediateSchedulerType {
        return CurrentThreadScheduler.instance
    }
    
    func backgroundScheduler() -> ImmediateSchedulerType {
        return CurrentThreadScheduler.instance
    }
    
}

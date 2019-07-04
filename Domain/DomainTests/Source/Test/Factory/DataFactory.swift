//
//  DataFactory.swift
//  DomainTests
//
//  Created by Vasanthakumar Annadurai on 02/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
 A file provides random test data for common types.
 */

func randomInt()-> Int{
    return Int.random(in: 0..<Int.max)
}

func randomBool()-> Bool{
    return Bool.random()
}

func randomDouble()-> Double{
    return Double.random(in: 0.0 ..< 100000.0)
}

func randomString()-> String{
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let length = Int.random(in: 1..<letters.count)
    return String((0..<length).map{ _ in letters.randomElement()! })
}

func randomDate()-> Date{
    return Date()
}

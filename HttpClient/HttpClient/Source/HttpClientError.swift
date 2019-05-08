//
//  HttpClientError.swift
//  HttpClient
//
//  Created by Vasanthakumar Annadurai on 07/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation


/**
    A Enum defines all posibile exceptions from HttpClient.
 */
public enum HttpClientError: Error{
    
    /// Indicates that no network to make Http request.
    case noNetworkError
    
    /// Indicates that Url can't be formed with the given string.
    case inValidUrlError
    
    /// Indicates that any transport error occurs.
    case clientError(error: Error)
    
    /// Indicates that any server error occurs.
    case serverError(httpResponse: HTTPURLResponse)
    
    /// Indicates that parsing has been failed.
    case parseError(error: Error)
    
    /// Indicates that some thing unknown other than above happend.
    case unKnownError
    
}

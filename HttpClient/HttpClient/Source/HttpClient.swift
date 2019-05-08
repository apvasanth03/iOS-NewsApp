//
//  HttpClient.swift
//  HttpClient
//
//  Created by Vasanthakumar Annadurai on 07/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
 Interface defines Common HTTP Methods.
 
 Hence we need to implement this interface using some HTTP client (like URLSession, Alamofire etc) and
 provide functionality for the HTTP methods.
 
 Inside our application we will only refer this interface for any HTTP calls there by abstracting
 the third party HTTP client implementation.
*/

public protocol HttpClient{
    
    /**
     Used to make "HTTP GET REQUEST" & get response using completion handler.
     
     - parameters:
        - urlString: Request Url.
        - headers: Request headers.
        - type: Type to which response has to be parsed.
        - successHandler: Action to invoke upon success with response.
        - errorhandler: Action to invoke upon error.
    */
    func getRequest<T:Decodable>(for urlString: String,
                                 with headers: [String:String]?,
                                 parseTo type: T.Type,
                                 successHandler: @escaping (T)->Void,
                                 errorhandler: @escaping (HttpClientError)->Void)
    
}

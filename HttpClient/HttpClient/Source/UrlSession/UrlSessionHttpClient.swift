//
//  UrlSessionHttpClient.swift
//  HttpClient
//
//  Created by Vasanthakumar Annadurai on 07/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation

/**
    HttpClient implementation using iOS UrlSession.
 */

public class UrlSessionHttpClient: HttpClient{
    
    // MARK: Properties.
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    // MARK: Initializers.
    public init() {
        urlSession = URLSession(configuration: .default)
        jsonDecoder = JSONDecoder()
    }
    
    // MARK: HttpClient Methods.
    public func getRequest<T>(for urlString: String, with headers: [String : String]?, parseTo type: T.Type, successHandler: @escaping (T) -> Void, errorhandler: @escaping (HttpClientError) -> Void) where T : Decodable {
        // Check network connection.
        if Reachability.isConnectedToNetwork(){
            
            guard let url = URL(string: urlString) else{
                errorhandler(.inValidUrlError)
                return
            }
            
            let urlRequest: URLRequest = {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                return request
            }()
            
            let urlSessionDataTask = urlSession.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
                
                // Check for client error.
                if let error = error {
                    self.handleClientError(error, errorhandler)
                    return
                }
                
                // Check for server error.
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        self.handleServerError(response, errorhandler)
                        return
                }
                
                // Parse data.
                if let data = data{
                    self.handleSuccessResponse(data, type, successHandler, errorhandler)
                    return
                }
                
                // Shouldn't be coming here.
                errorhandler(.unKnownError)
            })
            
            urlSessionDataTask.resume()
            
        }
        else{
            errorhandler(.noNetworkError)
        }
    }
    
    // MARK: Private Methods.
    private func handleClientError(_ error: Error, _ errorhandler: (HttpClientError)->Void){
        errorhandler(.clientError(error: error))
    }
    
    private func handleServerError(_ response: URLResponse?, _ errorhandler: (HttpClientError)->Void){
        if let httpResponse = response as? HTTPURLResponse{
            errorhandler(.serverError(httpResponse: httpResponse))
        }else{
            errorhandler(.unKnownError)
        }
    }
    
    private func handleSuccessResponse<T:Decodable>(_ data: Data, _ type: T.Type,
                                                    _ successHandler: (T)->Void, _ errorhandler: (HttpClientError)->Void){
        do{
            if type == String.self{
                let stringResponse = String(data: data, encoding: .utf8) as! T
                successHandler(stringResponse)
            }else{
                let parsedResponse = try jsonDecoder.decode(type, from: data)
                successHandler(parsedResponse)
            }
        } catch let error{
            errorhandler(.parseError(error: error))
        }
    }
}

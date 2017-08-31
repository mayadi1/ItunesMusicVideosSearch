//
//  AppleEndPoint.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import Foundation

// example: https://itunes.apple.com/search?term=jack johnson&entity=musicVideo

enum AppStoreEndpoint
{
    case search(term: String, entity: String)
    
    var request: URLRequest {
        var components = URLComponents(string: baseURL)!
        components.path = path
        components.queryItems = queryComponents
        
        let url = components.url!
        return URLRequest(url: url)
    }
    
    private var baseURL: String {
        return "https://itunes.apple.com/"
    }
    
    private var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    
    private struct ParameterKeys {
         static let term = "term"
        static let entity = "entity"
    }
    
    
    // ["term" : "jack johnson", "entity" : "musicVideo"]
    private var parameters: [String : Any] {
        switch self {
        case .search(let term, let entity):
            let parameters: [String : Any] = [
                ParameterKeys.term : term,
                ParameterKeys.entity : entity
            ]
            
            return parameters
        }
    }
    
    private var queryComponents: [URLQueryItem] {
        var components = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
        }
        
        return components
    }
}

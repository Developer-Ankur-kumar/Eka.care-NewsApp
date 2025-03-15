//
//  EndPoint.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation

enum EndPoint {
    
    case news (category: Category, country: Country)
    case sources
    case search (searchString: String)

    var urlRequest : URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        
        let apiKey = "22d00df5442844479916ba21009b4bc9"
        var queryItems = [URLQueryItem(name: "apiKey", value: apiKey)]

        switch self {
            case .news(category: let category, country: let country):
                components.path = "/v2/top-headlines"
                queryItems.append(URLQueryItem(name: "country", value: country.rawValue))
                queryItems.append(URLQueryItem(name: "category", value: category.rawValue))

            case .sources:
                components.path = "/v2/sources"
            
            case .search(searchString: let searchString):
                components.path = "/v2/everything"
                queryItems.append(URLQueryItem(name: "q", value: searchString))
        }
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
    
}

//
//  NetworkManager.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation
import Combine


enum LoadingState<Item> {
    case idle
    case loading
    case loaded(items: [Item])
    case error(error: Error)
}

protocol ApiService {
    func fetchNews(endpoint: EndPoint) -> AnyPublisher<ArticlesResponse, Error>
}

class ApiServiceImpl: ApiService {
        
    func fetchNews(endpoint: EndPoint) -> AnyPublisher<ArticlesResponse, Error> {
        run(endpoint.urlRequest)
    }

    
    private func run<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .retry(3)
            .timeout(3, scheduler: RunLoop.main)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            //.map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}


struct URLString{
    static var token = "22d00df5442844479916ba21009b4bc9"
    static let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=22d00df5442844479916ba21009b4bc9"
}

enum ErrorResponse:Error{
    case InvalidURL
    case InvalidData
    case FaildToDecode
}


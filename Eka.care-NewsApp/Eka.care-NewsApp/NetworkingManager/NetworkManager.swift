//
//  NetworkManager.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation
import Combine


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
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

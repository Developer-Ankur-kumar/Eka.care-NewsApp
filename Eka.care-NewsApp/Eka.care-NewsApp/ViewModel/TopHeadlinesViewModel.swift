//
//  NewsViewModel.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation
import Combine

class TopHeadlinesViewModel: ObservableObject {
    
    let service = ApiServiceImpl()
    @Published var category: Category = .general
    @Published var country: Country = .us
    @Published var articles: [Article] = []
    var cancellable: Set<AnyCancellable> = []

    func loadNews() {
        
        Publishers.CombineLatest($category, $country)
        .setFailureType(to: Error.self)
        .flatMap {  (category, country) -> AnyPublisher<ArticlesResponse, Error> in
            return self.service.fetchNews(endpoint: EndPoint.news(category: category, country: country))
        }
        .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                        self?.articles = response.articles
                    })
        .store(in: &self.cancellable)
        
    }
}


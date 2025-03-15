//
//  File.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation

struct ArticlesResponse:Decodable{
    let status: String
    let totalResults: Int
    let message: String?
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable, Identifiable  {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt : String
    let content: String?
}

// MARK: - Source
struct Source: Hashable, Decodable, Identifiable {
    let id: String?
    let name: String?
    let description: String?
    let country: String?
    let category: String?
    let url: String?
}

//
//  ContentView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 13/03/25.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {
    let article: Article
    @State private var isSaved = false

    var body: some View {
        VStack {
            WebView(url: URL(string: article.url)!)
            HStack{
                Spacer()
                Button(action: {
                    CoreDataManager.shared.saveArticle(article)
                    isSaved = true
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 60, height: 60)
                            .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)

                        VStack {
                            Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                .font(.caption)
                                .foregroundColor(.black)

                            Text(isSaved ? "Saved":"Save")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()

            }
        }
    }
    
}




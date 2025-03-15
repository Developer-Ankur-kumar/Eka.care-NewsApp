//
//  NewsCellCardView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import SwiftUI

struct NewsCellCardView: View {
    
    var article:Article
    var body: some View {
        HStack(alignment: .top,spacing: 10){
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Image("placeholderImage")
                    .resizable().scaledToFill()
            }
            .frame(width: 120, height: 120)
            .cornerRadius(12)
            VStack(alignment: .leading){
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(article.description ?? "description not available")
                    .font(.caption)
                    .lineLimit(4)
                    .foregroundColor(.secondary)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: NewsDetailView(article: article)) {
                        Text("Read More...")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
        .frame( height: 140)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemBackground))
                .shadow(color: Color(.systemGray4), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal,10)
    }
}



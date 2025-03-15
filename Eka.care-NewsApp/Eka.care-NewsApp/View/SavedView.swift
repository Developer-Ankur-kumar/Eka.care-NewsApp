//
//  SavedView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 13/03/25.
//

import SwiftUI

struct SavedView: View {
    
    @State var savedArticles: [SavedArticle] = []
    @StateObject var viewModel = TopHeadlinesViewModel()
    
    var body: some View {
        NavigationStack {
            List (savedArticles, id: \.self) { article in
                HStack(alignment: .top,spacing: 10){
                    AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Image("placeholderImage")
                            .resizable().scaledToFill()
                    }
                    .frame(width: 120, height: 120)
                    .cornerRadius(12)
                    HStack(alignment: .top, spacing:10){
                        VStack(alignment: .leading){
                            Text(article.title ?? "")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .lineLimit(1)
                            Text(article.descriptionText ?? "")
                                .font(.caption)
                                .lineLimit(4)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Spacer()
                                NavigationLink(destination: WebView(url: URL(string: article.articleURL ?? "")!)) {
                                    Text("Read More...")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button {
                            CoreDataManager.shared.deleteArticle(article)
                            savedArticles = CoreDataManager.shared.fetchSavedArticles()
                            
                        }label:{
                            Image(systemName: "trash.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.red)
                            
                        }
                        
                    }
                }
                .listRowSeparator(.hidden)
                .padding()
                .frame( height: 140)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(color:Color(.systemGray4), radius: 4, x: 0, y: 2)
                )
                .padding(.horizontal,10)
                
            }
            .navigationTitle("Saved Articles")
            .listRowInsets(EdgeInsets())
            .buttonStyle(PlainButtonStyle())
            .listStyle(PlainListStyle())
            
        }
        .onAppear {
            savedArticles = CoreDataManager.shared.fetchSavedArticles()
        }
        
    }
}
 


#Preview {
    SavedView()
}

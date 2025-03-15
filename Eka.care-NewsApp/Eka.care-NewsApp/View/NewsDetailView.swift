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
    @State private var showShareSheet = false
    
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
                
                Button(action: {
                    showShareSheet = true
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
                        
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            Text("Share")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(items: [article.title, URL(string: article.url)!])
                }
                
            }
        }
    }
    
}


struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any] // Items to share (URL, text, etc.)

    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}



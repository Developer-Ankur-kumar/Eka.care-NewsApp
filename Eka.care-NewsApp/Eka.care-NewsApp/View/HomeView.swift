//
//  HomeView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 13/03/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = TopHeadlinesViewModel()

    var body: some View {
        NavigationStack{
            Form {
                Picker(selection: $viewModel.category, label: Text("Category")) {
                    ForEach(Category.allCases, id: \.self) {
                        Text(String(describing: $0))
                    }
                }

            }.frame(maxHeight: 96)
            List(viewModel.articles) { article in
                    NewsCellCardView(article: article)
                    .padding()
                    .listRowInsets(EdgeInsets())
                    .buttonStyle(PlainButtonStyle())
                    .listRowSeparator(.hidden)
                }
            .navigationTitle("TopHeadline News")
            .listStyle(PlainListStyle())

            }
            .onAppear{
                self.viewModel.loadNews()
            }
             
            
        }
      
    }



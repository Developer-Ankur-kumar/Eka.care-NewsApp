//
//  TabView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 13/03/25.
//

import SwiftUI

struct TabViewPage: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                        .font(.caption2)
                }
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                        .font(.callout)
                }
        }
    }
}


#Preview {
    TabViewPage()
}

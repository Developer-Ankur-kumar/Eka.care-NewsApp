//
//  WebView.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//
//  WebView.swift
//  HackerNews
//
//  Created by Bengi Anıl on 13.03.2023.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString, let url = URL(string: urlString)  {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

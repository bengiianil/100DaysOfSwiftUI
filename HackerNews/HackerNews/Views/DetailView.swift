//
//  DetailView.swift
//  HackerNews
//
//  Created by Bengi Anıl on 13.03.2023.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com.tr").previewLayout(.sizeThatFits)
    }
}

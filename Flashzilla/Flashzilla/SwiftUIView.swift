//
//  SwiftUIView.swift
//  Flashzilla
//
//  Created by Bengi Anıl on 11.11.2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundStyle(.red)
            Text("Hello, World!").background(.red)
            Image(systemName: "person.3")
                .interpolation(/*@START_MENU_TOKEN@*/.high/*@END_MENU_TOKEN@*/)
                .font(.headline)
        }
        .foregroundStyle(.blue)
    }
}

#Preview {
    SwiftUIView()
}

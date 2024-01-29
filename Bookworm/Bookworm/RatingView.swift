//
//  RatingView.swift
//  Bookworm
//
//  Created by Bengi Anıl on 23.10.2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if !label.isEmpty {
                
            }
            
            ForEach(1..<maxRating+1, id: \.self) { number in
                getImage(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func getImage(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
 }

#Preview {
    RatingView(rating: .constant(3))
}

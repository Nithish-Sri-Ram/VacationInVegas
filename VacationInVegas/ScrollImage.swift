//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by Nithish on 08/10/24.
//


//        //The content and phase are properties which come with the scroll transition modifier (Here the content means the image) (Phase is - where the image is located Up, down, or the bottom) We change the modifier on the content and change it according to the phase it is in

import SwiftUI

struct ScrollImage: View {
    let image: String
    var body: some View {
        Image(image) // Ensure this matches your asset name
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20)) // Using RoundedRectangle
            .scrollTransition { content, phase in
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.5) // Corrected scaleEffect usage
            }
    }
}

#Preview {
    ScrollImage(image: "bellagio")
}

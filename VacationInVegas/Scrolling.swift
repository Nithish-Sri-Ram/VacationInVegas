//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by Nithish on 08/10/24.
//


//        //The content and phase are properties which come with the scroll transition modifier (Here the content means the image) (Phase is - where the image is located Up, down, or the bottom) We change the modifier on the content and change it according to the phase it is in

import SwiftUI

struct Scrolling: View {
    var body: some View {
        ScrollView{
            VStack{
                ScrollImage(image: "bellagio")
                
                ScrollImage(image: "excalibur")
                
                ScrollImage(image: "luxor")
                
                ScrollImage(image: "paris")
                
                ScrollImage(image: "stratosphere")
                
                ScrollImage(image: "treasureisland")
            }
            .padding()
        }
    }
}

#Preview {
    Scrolling()
}

//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var place: Place
    
    @State var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position){
            Annotation(place.interested ? "Place of Interest": "Not Interested", coordinate: place.location){
                ZStack{
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThickMaterial)
                        .stroke(.secondary, lineWidth:5)
                    Image(systemName: place.interested ? "face.smiling" : "hand.thumbsdown")
                        .padding(5)
                }
                .onTapGesture{
                    place.interested.toggle()
                }
            }
        }
        .toolbarBackground(.automatic)
        //The white big top (safe area thing is gone from the top) while navigationg to the screens
    }
}


//The distance is the height(How far from the ground it is)
//heading is the angle you are looking at from
//Pitch - angle
#Preview {
    //we can create the state properties within the preview using the @Previewable
    
    @Previewable @State var place = Place.previewPlaces[0]
    
    MapView(place: place, position: .camera(MapCamera(
        centerCoordinate: place.location,
        distance: 1000,
        heading: 250,
        pitch: 80
    )))
}

//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI
import SwiftData    //this library is to interact with the databases
import _MapKit_SwiftUI
 
struct PlaceList: View {
    
    @Query(sort:\Place.name) private var places: [Place]
    
    
    @State private var showImages = false
    @State private var searchText = ""
    @State private var filterByInterested = false
    
    @Namespace var namespace
    
    private var predicate: Predicate<Place>{
        #Predicate<Place>{
            if !searchText.isEmpty && filterByInterested{
                //The $0 is to tell - wherever place we are on
                //So overall - it returns the boolean value: indicating weather the given string contains the given string
                $0.name.localizedStandardContains(searchText) && $0.interested
            } else if !searchText.isEmpty{
                $0.name.localizedStandardContains(searchText)
            }
            else if filterByInterested{
                $0.interested
            }
            else {
                //don't filter at all - just show everything
                true
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List((try? places.filter(predicate)) ?? places) {
                place in
                NavigationLink(value: place){
                    HStack{
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100,height: 100)
                        
                        Text(place.name)
                        
                        Spacer()
                        
                        if place.interested{
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding(.trailing)
                        }
                    }
                }
                .swipeActions(edge: .leading){
                    Button(place.interested ? "Interested" : "Not Interested", systemImage: "star") {
                        place.interested.toggle()
                    }
                    .tint(place.interested ? .yellow : .gray)
                }
                //the below transition is for the parent
//                .matchedTransitionSource(id: 1, in: namespace)
            }
            .navigationTitle("Places")
            .searchable(text: $searchText,prompt: "Find a place")
            .animation(.default,value: searchText)
            .navigationDestination(for: Place.self){
                place in
                MapView(place: place, position:
                        .camera(MapCamera(
                            centerCoordinate: place.location,
                            distance: 1000,
                            heading: 250,
                            pitch: 80
                        )))
                //The below is for the child
                //.navigationTransitio/*n(.zoom(sourceID: 1,in: namespace))*/
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Show Images", systemImage: "photo"){
                        showImages.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    Button("Filter", systemImage:
                            filterByInterested ? "star.fill" :"star"){
                        withAnimation{
                            filterByInterested.toggle()
                        }
                    }.tint(filterByInterested ? .yellow : .blue)
                }
            }
            
            
            
            .sheet(isPresented: $showImages) {
                Scrolling()
            }
        }
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}

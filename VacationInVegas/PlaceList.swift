//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI
import SwiftData    //this library is to interact with the databases
 
struct PlaceList: View {
    @Query(sort:\Place.name) private var places: [Place]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}

//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView{
            PlaceList()
                .tabItem{
                    Label("Places", systemImage: "photo")
                }
            
            TripsChart()
                .tabItem{
                    Label("Trip History", systemImage: "chart.line.uptrend.xyaxis")
                }
            
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(Place.preview)
}

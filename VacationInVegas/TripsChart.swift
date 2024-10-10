//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI
import Charts

struct SampleTripRating {
    let trip: Int
    let rating: Int
    
    static let ratings: [SampleTripRating] = [
        SampleTripRating(trip: 1, rating: 55),
        SampleTripRating(trip: 2, rating: 27),
        SampleTripRating(trip: 3, rating: 67),
        SampleTripRating(trip: 4, rating: 72),
        SampleTripRating(trip: 5, rating: 81),
    ]
}

struct TripsChart: View {
    var body: some View {
        Chart(SampleTripRating.ratings, id: \.trip){
            rating in
            //We are doing a math function plot
            BarMark(x: .value("Year",rating.trip), y: .value("Rating",rating.rating))
            
//            LinePlot(x: "Years", y: "Ratings"){
//                x in
//                return x * 6 + 50
//            }
//            .foregroundStyle(.purple)
            ForEach(1...5, id: \.self) { trip in
                            let yValue = trip * 6 + 50
                            LineMark(x: .value("Year", trip), y: .value("Rating", yValue))
                                .foregroundStyle(.purple)
                        }
        }
        .chartXScale(domain: 1...5)
        .chartYScale(domain: 1...100)
        .padding()
        .frame(height:  500)
    }
}

#Preview {
    TripsChart()
}

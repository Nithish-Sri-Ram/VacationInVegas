//
//  Place.swift
//  VacationInVegas
//
//  Created by Nithish on 08/10/24.
//

import SwiftUI
import SwiftData
import MapKit

//@available(iOS 18, *)
@Model
class Place{
//    Make sure the name and combination of all the plces is unique with the below
    
//    #Unique<Place>([\.name,\.latitude,\.longitude]) //This works for iOS 18
    
    //The name has to be unique - we cant have 2 bellagio's
    @Attribute(.unique) var name: String
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image: Image{
        Image(name.lowercased().replacingOccurrences(of: " ", with: ""))
    }
    
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
    
//    static func isUniqueCombination(name: String, latitude: Double, longitude: Double) -> Bool{
//        return true;
//    }

//    Use @MainActor for classes or structs managing UI state, such as view models in SwiftUI.
    
    @MainActor
    static var preview: ModelContainer{
        //The data in the model is only stored in current working memory
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //Look though all the places and insert the place into the model container
        for place in previewPlaces{
            container.mainContext.insert(place)
        }
        return container
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, interested: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1765, interested: true),
            Place(name: "Treasure Island", latitude: 36.1247, longitude: -115.1765, interested: false),
            Place(name: "Stratosphere", latitude: 36.1475, longitude: -115.1765, interested: true),
            Place(name: "Luxor", latitude: 36.0955, longitude: -115.1765, interested: false),
            Place(name: "Excalibur", latitude: 36.0988, longitude: -115.1765, interested: false),
        ]
    }
}

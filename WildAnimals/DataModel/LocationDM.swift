//
//  LocationDM.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import Foundation
import MapKit

struct LocationDM: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let testLocation = LocationDM(id: "serengeti", name: "Serengeti National Park", image: "map-serengeti", latitude: -2.3333333, longitude: 34.8333333)

//
//  VideoDM.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import Foundation

struct VideoDM: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

let lionVideo = VideoDM(id: "lion", name: "Lion", headline: "Close-up of a growling African lion")

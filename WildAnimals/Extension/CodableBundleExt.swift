//
//  CodableBundleExt.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the bundle.")
        }
        
        return decodedData
    }
}

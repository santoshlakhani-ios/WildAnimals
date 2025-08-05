//
//  AnilGridItemView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 09/03/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - Properties
    let animal: AnimalDM
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AnimalGridItemView(animal: lionAnimal)
        .padding()
}

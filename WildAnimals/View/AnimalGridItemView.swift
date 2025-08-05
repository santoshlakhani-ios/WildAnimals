//
//  AnilGridItemView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 09/03/24.
//

import SwiftUI

struct AnilGridItemView: View {
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
    AnilGridItemView(animal: lionAnimal)
        .padding()
}

//
//  InsetFactView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - Properties
    let animal: AnimalDM
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: Tab View
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: Group Box
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InsetFactView(animal: lionAnimal)
        .padding()
}

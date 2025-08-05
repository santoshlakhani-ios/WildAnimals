//
//  ExternalWeblinkView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - Properties
    let animal: AnimalDM
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundStyle(.accent)
            } //: Hstack
        } //: Group Box
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ExternalWeblinkView(animal: lionAnimal)
        .padding()
}

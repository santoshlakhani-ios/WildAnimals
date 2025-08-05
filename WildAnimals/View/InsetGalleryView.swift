//
//  InsetGalleryView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - Properties
    let animal: AnimalDM
    
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id:\.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                } //: ForEach Loop
            } //: HStack
        } //: Scroll View
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InsetGalleryView(animal: lionAnimal)
        .padding()
}

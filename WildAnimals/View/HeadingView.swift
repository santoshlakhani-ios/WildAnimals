//
//  HeadingView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - Properties
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .padding()
}

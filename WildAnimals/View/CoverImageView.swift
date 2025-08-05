//
//  CoverImageView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - Properties
    
    let coverImages: [CoverImageDM] = Bundle.main.decode("covers.json")
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: For Loop
        } //: Tab view
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}

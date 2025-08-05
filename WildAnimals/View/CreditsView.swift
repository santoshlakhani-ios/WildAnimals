//
//  CreditsView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 09/03/24.
//

import SwiftUI

struct CreditsView: View {
 
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
    Copyright © Santosh Lakhani
    All rights reserved
    Think beyond ♡
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
        .padding()
}

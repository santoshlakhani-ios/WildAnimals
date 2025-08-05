//
//  MapAnnotationView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 06/03/24.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - Properties
    var location: LocationDM
    @State private var animation: Double = 0.0
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MapAnnotationView(location: testLocation)
        .padding()
}

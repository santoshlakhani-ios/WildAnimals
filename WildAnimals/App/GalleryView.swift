//
//  GalleryView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 04/03/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    
    let animals: [AnimalDM] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
        
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { oldValue, newValue in
                        gridSwitch()
                    }
                
                //MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                } //:Grid
                .animation(.easeIn, value: gridColumn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //:Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}

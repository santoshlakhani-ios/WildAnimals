//
//  AnimalDetailView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - Properties
    let animal: AnimalDM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //HERO Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color(.accent)
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                
                //Galarry
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "Learn about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
            } //: VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
            
        } //: Scroll View
    }
}

#Preview {
    NavigationView {
        AnimalDetailView(animal: lionAnimal)
    }
}

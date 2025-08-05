//
//  ContentView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 04/03/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    //MARK: - Properties
    let animals: [AnimalDM] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
       //MARK: - Properties
        
        NavigationView(content: {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                } //: Link
                            } //: Loop
                        } //: Grid
                    } //: Scrollview
                }
            } //: Group
            .navigationBarTitle("Wild Animals", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16, content: {
                        Button {
                            isGridViewActive = false
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            isGridViewActive = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accent : .primary)
                        })
                    }) //: HStack
                } //: TB Items
            } //: Toolbar
        }) //: Navigation View
    }
}

#Preview {
    ContentView()
}

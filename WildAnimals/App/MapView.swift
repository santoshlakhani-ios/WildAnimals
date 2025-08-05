//
//  MapView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 04/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCenter = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCenter, span: zoomLevel)
        return mapRegion
    }()
    
    let locations: [LocationDM] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .center, spacing: 3) {
                    HStack(content: {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    })
                    
                    Divider()
                    
                    HStack(content: {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    })
                } //: VStack
            } //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        ) //: Overlay
    }
}

#Preview {
    MapView()
}

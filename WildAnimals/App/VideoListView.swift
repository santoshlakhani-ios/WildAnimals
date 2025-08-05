//
//  VideoListView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 04/03/24.
//

import SwiftUI

struct VideoListView: View {
    //MARK: Properties
    @State var videos: [VideoDM] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } //: Navigation View
    }
}

#Preview {
    VideoListView()
}

//
//  VideoPlayerView.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - Properties
    let videoSelected: String
    let videoTitle: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        } //: VStack
        .accentColor(.accent)
        .navigationBarTitle(videoTitle, displayMode: .inline)
        
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "elephant", videoTitle: "Elephant")
    }
}

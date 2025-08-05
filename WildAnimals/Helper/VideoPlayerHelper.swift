//
//  VideoPlayerHelper.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 05/03/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let videoFileURL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: videoFileURL)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}

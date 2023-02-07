//
//  PlayerViewModel.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 03/02/2023.
//

import Foundation
import AVKit

class PlayerViewModel: ObservableObject {
    // MARK: - Properties
    private var player: AVPlayer?
    
    // MARK: - Trick methods
    func initPlayer(url: URL) {
        let item = AVPlayerItem(url: url)
        self.player = AVPlayer(playerItem: item)
    }
    
    func play() {
        if let player = player {
            player.play()
        }
    }
    
    func pause() {
        if let player = player {
            player.pause()
        }
    }
}

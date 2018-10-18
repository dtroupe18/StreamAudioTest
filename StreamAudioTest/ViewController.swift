//
//  ViewController.swift
//  StreamAudioTest
//
//  Created by Dave on 10/17/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVPlayer?
    var audioPlayer = AVAudioPlayer()
    
    let songURL: URL = URL(string: "https://firebasestorage.googleapis.com/v0/b/streamaudiotest-1e0d9.appspot.com/o/1.%20Walk%20On%20Water%20(feat.%20Beyonce%CC%81).mp3?alt=media&token=bfbebdd5-89a5-4fa8-a8d8-436a6a0912d2")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playMusic(_ sender: Any) {
        print("Calling streamSong")
        
        streamSongFrom(url: songURL)
        // streamWithAudioPlayer(url: songURL)
    }
    
    private func streamWithAudioPlayer(url: URL) {
        print("Starting to use Audio Player")
        do {
            // try AVAudioSession.sharedInstance().setMode(.default)
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 1.0
            audioPlayer.play()
        } catch {
            print("Error creating audio player: \(error.localizedDescription)")
        }
    }
    
    private func streamSongFrom(url: URL) {
        // Uses AVPlayer
        print("Starting to stream song")
        
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.volume = 1.0
        player?.playImmediately(atRate: 1.0)
    }
    
    @IBAction func pauseMusic(_ sender: Any) {
        
        if player == nil {
            if audioPlayer.rate != 0.0 {
                audioPlayer.pause()
            } else {
                audioPlayer.play()
            }
        } else {
            if player?.rate != 0.0 && player?.error == nil {
                player?.pause()
            } else {
                player?.play()
            }
        }
    }
}


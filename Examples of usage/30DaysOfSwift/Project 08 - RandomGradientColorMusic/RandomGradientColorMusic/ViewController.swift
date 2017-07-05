//
//  ViewController.swift
//  RandomGradientColorMusic
//
//  Created by willwei on 2017/7/3.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var audioPlayer: AVAudioPlayer!

    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action

    @IBAction func playMusicButtonDidTouch(_ sender: UIButton) {
        let musicURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
            try session.setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error {
            print(error)
        }
    }

}


//
//  ViewController.swift
//  VideoBackground
//
//  Created by willwei on 2017/7/19.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let avplayerVC = AVPlayerViewController()
    
    
    // MARK: - View Load
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avplayerVC.view.frame = view.frame
        avplayerVC.showsPlaybackControls = false
        view.addSubview(avplayerVC.view)
        view.sendSubview(toBack: avplayerVC.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupBackgroundVideo()
    }
    
    // MARK: - Deinit
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Orientation
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: - Video
    
    private func setupBackgroundVideo() {
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        avplayerVC.player = AVPlayer(url: url)
        avplayerVC.player?.play()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerItemDidPlayEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avplayerVC.player?.currentItem)
    }
    
    // MARK: - Notification
    
    func playerItemDidPlayEnd() {
        avplayerVC.player?.seek(to: kCMTimeZero)
        avplayerVC.player?.play()
    }


}


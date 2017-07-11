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
    var timer: Timer!
    let gradientLayer = CAGradientLayer()

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
        // Music
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
        
        // Timer
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        // Gradient Color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1.0, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.1, 0.3, 0.5, 0.7, 0.6]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func randomColor() {
        let redColor = CGFloat(drand48())
        let greenColor = CGFloat(drand48())
        let blueColor = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }

}


//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by willwei on 2017/6/6.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var counter = 0.0
    var timer: Timer? = nil
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action

    @IBAction func resetButtonClicked(_ sender: UIButton) {
        guard timer != nil else {
            return
        }
        timer?.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        if isPlaying {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonClicked(_ sender: UIButton) {
        timer?.invalidate()
        isPlaying = false
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    // MARK: - Callback
    
    func updateTime() {
        counter += 0.1;
        timeLabel.text = String.init(format: "%.1f", counter)
    }

}


//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by willwei on 2017/6/8.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VideoTableViewCellDelegate {
    
    // MARK: - Properties
    
    let dataSource = [
        VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        cell.delegate = self
        
        let model = dataSource[indexPath.row]
        cell.updateUIWithData(model: model)
        
        cell.closure = {(sender: UIButton) -> Void in
            let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
            let player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true, completion: { 
                playerViewController.player?.play()
            })
        }
        
        return cell
    }
    
    // MARK: - VideoTableViewCellDelegate
    func videoTableViewCell(_ cell: VideoTableViewCell, sender: UIButton) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true, completion: {
            playerViewController.player?.play()
        })
    }

}


//
//  ViewController.swift
//  FindMyLocation
//
//  Created by willwei on 2017/6/23.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Button Action

    @IBAction func findMyLocationButtonDidTouch(_ sender: UIButton) {
    }

}


//
//  ViewController.swift
//  SnapChatMenu
//
//  Created by willwei on 2017/6/9.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UIApplication.shared.isStatusBarHidden = true
        
        let leftVC: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let cameraVC: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMove(toParentViewController: self)
        
        self.addChildViewController(cameraVC)
        self.scrollView.addSubview(cameraVC.view)
        cameraVC.didMove(toParentViewController: self)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMove(toParentViewController: self)
        
        var cameraViewFrame: CGRect = cameraVC.view.frame
        cameraViewFrame.origin.x = self.view.frame.width
        cameraVC.view.frame = cameraViewFrame
        
        var rightViewFrame: CGRect = rightVC.view.frame
        rightViewFrame.origin.x = self.view.frame.width * 2
        rightVC.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


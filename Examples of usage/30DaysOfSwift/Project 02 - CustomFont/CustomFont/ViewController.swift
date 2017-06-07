//
//  ViewController.swift
//  CustomFont
//
//  Created by willwei on 2017/6/7.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    var dataSource = ["30 Days Swift",
                      "CustomFont",
                      "这些字体特别适合打「奋斗」和「理想」",
                      "小乔治·史密斯·巴顿",
                      "使用到造字工房劲黑体，致黑体，童心体",
                      "呵呵，再见🤗 See you next Project",
                      "西班牙皇家马德里足球俱乐部成功击败意大利尤文图斯足球俱乐部，赢得欧洲冠军联赛冠军",
                      "英国伦敦市博罗市场和伦敦桥分别遭遇恐怖袭击，造成至少7人死亡和28人受伤",
                      "123sefaslkufFNASEF@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.changeFontButton.layer.cornerRadius = 55
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action

    @IBAction func changeFontButtonClicked(_ sender: UIButton) {
        self.fontRowIndex = (self.fontRowIndex + 1) % 4
        print(fontNames[fontRowIndex])
        self.fontTableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let text = self.dataSource[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.init(name: self.fontNames[self.fontRowIndex], size: 16)
        
        return cell
    }

}


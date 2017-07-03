//
//  ViewController.swift
//  PullToRefresh
//
//  Created by willwei on 2017/6/27.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - TableView Data
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    // MARK: - Properties
    
    let cellIdentifer = "NewCellIdentifier"
    
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .plain)
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))

    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        emojiData = favoriteEmoji
        
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        let emojiTableView = tableViewController.tableView!
        emojiTableView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-64)
        emojiTableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        emojiTableView.dataSource = self
        emojiTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        self.refreshControl.tintColor = UIColor.white
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        tableViewController.refreshControl = self.refreshControl
        
        self.view.addSubview(navBar)
        self.view.addSubview(emojiTableView)
        
    }
    
    // MARK: - Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)!
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    // MARK: - Action
    
    func didRoadEmoji() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.emojiData = self.newFavoriteEmoji
            self.tableViewController.tableView.reloadData()
            let attributes = [NSForegroundColorAttributeName: UIColor.white]
            self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
            self.refreshControl.endRefreshing()
        }
    }
    

}

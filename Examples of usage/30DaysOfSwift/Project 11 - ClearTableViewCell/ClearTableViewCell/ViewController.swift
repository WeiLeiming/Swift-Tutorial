//
//  ViewController.swift
//  ClearTableViewCell
//
//  Created by willwei on 2017/7/24.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    let dataSource = ["Read 3 article on Medium",
                      "Cleanup bedroom",
                      "Go for a run",
                      "Hit the gym",
                      "Build another swift project",
                      "Movement training",
                      "Fix the layout problem of a client project",
                      "Write the experience of #30daysSwift",
                      "Inbox Zero",
                      "Booking the ticket to Chengdu",
                      "Test the Adobe Project Comet",
                      "Hop on a call to mom"]

    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.black
        setupTableView()
    }

    // MARK: - Memory
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - TableView
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorforIndex(indexPath.row)
    }
    
    // MAKR: - Private Method

    private func colorforIndex(_ index: Int) -> UIColor {
        let itemCount = dataSource.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }

}


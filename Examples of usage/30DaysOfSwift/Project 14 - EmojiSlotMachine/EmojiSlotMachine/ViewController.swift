//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by willwei on 2017/8/7.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - IBOutlet

    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Properties
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bounds = goButton.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0..<100 {
            dataArray1.append(Int(arc4random_uniform(10)))
            dataArray2.append(Int(arc4random_uniform(10)))
            dataArray3.append(Int(arc4random_uniform(10)))
        }
        resultLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: { 
            self.goButton.alpha = 1
        }, completion: nil)
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
    
    // MARK: - Action

    @IBAction func goButtoDidTouch(_ sender: UIButton) {
        emojiPickerView.selectRow(Int(arc4random_uniform(90)) + 3, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random_uniform(90)) + 3, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random_uniform(90)) + 3, inComponent: 2, animated: true)
        let select0 = dataArray1[emojiPickerView.selectedRow(inComponent: 0)]
        let select1 = dataArray2[emojiPickerView.selectedRow(inComponent: 1)]
        let select2 = dataArray3[emojiPickerView.selectedRow(inComponent: 2)]
        if select0 == select1 && select1 == select2 {
            resultLabel.text = "Bingo!"
        } else {
            resultLabel.text = "💔"
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: { 
            self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
        }) { (complete) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: { 
                self.goButton.bounds = self.bounds
            }, completion: nil)
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[dataArray1[row]]
        } else if component == 1 {
            pickerLabel.text = imageArray[dataArray2[row]]
        } else {
            pickerLabel.text = imageArray[dataArray3[row]]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }

}


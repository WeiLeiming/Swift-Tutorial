//
//  VideoTableViewCell.swift
//  PlayLocalVideo
//
//  Created by willwei on 2017/6/8.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

typealias ClosureType = (UIButton) -> Void

protocol VideoTableViewCellDelegate: NSObjectProtocol {
    func videoTableViewCell(_ cell: VideoTableViewCell, sender: UIButton)
}

class VideoTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    var closure: ClosureType?
    weak var delegate: VideoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public Method
    
    public func updateUIWithData(model: Any) {
        let model = model as! VideoModel
        videoScreenshot.image = UIImage.init(named: model.image)
        videoTitleLabel.text = model.title
        videoSourceLabel.text = model.source
    }
    
    // MARK: - Action
    
    @IBAction func playVideoButtonClicked(_ sender: UIButton) {
        self.delegate?.videoTableViewCell(self, sender: sender)
        
        guard self.closure != nil else {
            return
        }
//        self.closure!(sender)
    }

}

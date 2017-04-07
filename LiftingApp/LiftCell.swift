//
//  LiftCell.swift
//  LiftingApp
//
//  Created by Zachary Cox on 4/7/17.
//  Copyright © 2017 Zachary Cox. All rights reserved.
//

import UIKit

class LiftCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var buttonStack: UIStackView!
    
    
    @IBAction func setButton(_ sender: UIButton) {
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(10, 10, 10, 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

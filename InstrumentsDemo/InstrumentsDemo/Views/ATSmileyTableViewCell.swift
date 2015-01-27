//
//  ATSmileyTableViewCell.swift
//  InstrumentsDemo
//
//  Created by Ashish Tyagi on 27/01/15.
//  Copyright (c) 2015 Ashish Tyagi. All rights reserved.
//

import UIKit

class ATSmileyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var smileyImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSmileyImage(image: UIImage) {
        let imageView = UIImageView(frame: CGRectMake(10, 10, 80, 80))
        self.addSubview(imageView)
        imageView.image = image
    }
}

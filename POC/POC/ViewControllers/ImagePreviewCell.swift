//
//  ImagePreviewCell.swift
//  POC
//
//  Created by Sai on 25/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class ImagePreviewCell: UITableViewCell {

    @IBOutlet weak var img_img: UIImageView!
    @IBOutlet weak var img_date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

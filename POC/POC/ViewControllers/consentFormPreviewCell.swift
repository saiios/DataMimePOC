//
//  consentFormPreviewCell.swift
//  POC
//
//  Created by Sai on 25/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class consentFormPreviewCell: UITableViewCell {

    @IBOutlet weak var selfie_img: UIImageView!
    @IBOutlet weak var captureSelfie: UIButton!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var submit: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  PreviewCell.swift
//  POC
//
//  Created by Sai on 23/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {

    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessDNo: UILabel!
    @IBOutlet weak var category1: UILabel!
    @IBOutlet weak var category2: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var pincode: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var parking: UILabel!
    @IBOutlet weak var restroom: UILabel!
    @IBOutlet weak var fireExit: UILabel!
    @IBOutlet weak var wheelChair: UILabel!
    @IBOutlet weak var firstAid: UILabel!
    @IBOutlet weak var locality: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

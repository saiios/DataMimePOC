//
//  ViewController.swift
//  POC
//
//  Created by Sai on 18/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func list(_ sender: Any) {
                           self.performSegue(withIdentifier: "submissionListID", sender: self)

       }
}



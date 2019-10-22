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
    
    @IBAction func A(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "A")
    }
    
    @IBAction func B(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "B")
    }
    
    @IBAction func C(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "C")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        let vc = segue.destination as! MySubmissionsVC

        if ((sender as! String) == "A") {
            vc.isFrom = "A"
        } else if ((sender as! String) == "B") {
            vc.isFrom = "B"
        } else if ((sender as! String) == "C") {
            vc.isFrom = "C"
        }
        
    }
}



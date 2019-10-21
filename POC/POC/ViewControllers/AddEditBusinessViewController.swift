//
//  AddEditBusinessViewController.swift
//  POC
//
//  Created by Selvam on 21/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class AddEditBusinessViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtLocality: UITextField!
    @IBOutlet weak var txtLatLon: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtPinCode: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    
    var businessID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initialSetUp() {
        self.scrollView.contentSize = CGSize (width: 0, height: 2000)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

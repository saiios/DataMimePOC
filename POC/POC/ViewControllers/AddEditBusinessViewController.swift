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
    @IBOutlet weak var vwBusinessDetail: UIView!
    
    var businessID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initialSetUp()
        self.fetchBusinessDetails()
    }
    
    func initialSetUp() {
        self.scrollView.layer.shadowPath =
              UIBezierPath(roundedRect: self.scrollView.bounds,
              cornerRadius: self.scrollView.layer.cornerRadius).cgPath
        self.scrollView.layer.shadowColor = UIColor.black.cgColor
        self.scrollView.layer.shadowOpacity = 0.7
        self.scrollView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.scrollView.layer.shadowRadius = 5
        self.scrollView.layer.masksToBounds = false
        
    }
    
    func fetchBusinessDetails() {
        DataManager().fetchEachBusinessDetails(with: businessID ?? "") { BusinessDetailModel in
            DispatchQueue.main.async {
            self.txtAddress.text = BusinessDetailModel.businessDno
            self.txtLocality.text = BusinessDetailModel.locality
            self.txtLatLon.text = BusinessDetailModel.latitude
            self.txtCity.text = BusinessDetailModel.city
            self.txtState.text = BusinessDetailModel.state
            self.txtPinCode.text = BusinessDetailModel.pincode
            self.txtCountry.text = BusinessDetailModel.country
            }
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        self.scrollView.isHidden = true
    }
    @IBAction func previousAction(_ sender: Any) {
        self.scrollView.isHidden = false
        self.vwBusinessDetail.isHidden = true
    }
    
    @IBAction func page2BtnNextAction(_ sender: Any) {
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

extension AddEditBusinessViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

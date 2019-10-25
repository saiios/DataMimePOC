//
//  ViewController.swift
//  POC
//
//  Created by Sai on 18/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var regionTextFiled: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var regionPicker: UIPickerView!
    let regionsAry = ["India", "USA", "UAE"]
    let cityAry = ["MTM", "BZA", "VSKP", "HYD"]
    var selectedTag = ""
    var countries: [String] = []
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FOS"
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }

        print(countries)
    }
    
    @IBAction func openRegionPicker(_ sender: Any) {
        selectedTag = "Region"
        pickerView.isHidden = false
        picker.dataSource = self
        picker.delegate = self
    }
    
    @IBAction func openCityPicker(_ sender: Any) {
        selectedTag = "City"
        pickerView.isHidden = false
        picker.dataSource = self
        picker.delegate = self
    }
    @IBAction func A(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "Maintenance")
    }
    
    @IBAction func B(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "New")
    }
    
    @IBAction func C(_ sender: Any) {
     self.performSegue(withIdentifier: "submissionID", sender: "Enrichment")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        let vc = segue.destination as! MySubmissionsVC

        if ((sender as! String) == "Maintenance") {
            vc.isFrom = "Maintenance"
        } else if ((sender as! String) == "New") {
            vc.isFrom = "New"
        } else if ((sender as! String) == "Enrichment") {
            vc.isFrom = "Enrichment"
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(component)
        if  selectedTag == "Region" {
                    return countries.count
        } else {
            return cityAry.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if  selectedTag == "Region" {
                    return countries[row]
        } else {
            return cityAry[row]
        }
    }
    
    @IBAction func doneClick(_ sender: Any) {
        pickerView.isHidden = true
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
         // use the row to get the selected row from the picker view
         // using the row extract the value from your datasource (array[row])
        if  selectedTag == "Region" {
                    regionTextFiled.text = countries[row]
        } else {
            cityTextField.text = cityAry[row]
        }
     }
}



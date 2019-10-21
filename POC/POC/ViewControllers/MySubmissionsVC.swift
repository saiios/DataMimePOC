//
//  MySubmissionsVC.swift
//  POC
//
//  Created by Sai on 21/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class MySubmissionsVC: UIViewController {
    let dataManag = DataManager()
    var submissionsData: [MySubmissionsModel] = []

    @IBOutlet weak var paginationView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadUI()
        // Do any additional setup after loading the view.
    }
    
    func loadUI() {
        // Do any additional setup after loading the view.
        self.title = "My Submissions"
        
        self.dataManag.fetchList { (response) in
            print(response)
            self.submissionsData = response
            self.paginationView.reloadData()
        }
    }
    
    func loadNextData() {
//        self.startSpinner()
            self.dataManag.fetchList { (response) in
                print(response)
                self.submissionsData = self.submissionsData + response
                print(self.submissionsData)
                
                sleep(1)
                DispatchQueue.main.async {
                self.paginationView.reloadData()
//                    self.stopSpinner()
                }
            }
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

extension MySubmissionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.submissionsData.count
//        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySubmissionCell", for: indexPath) as! MySubmissionCell
        cell.status.text = self.submissionsData[indexPath.row].status
        cell.businessName.text = self.submissionsData[indexPath.row].businessName
        cell.businessDNO.text = self.submissionsData[indexPath.row].businessDno

        if indexPath.row == self.submissionsData.count - 1 {
            self.loadNextData()
        }
        return cell
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "attachmentsID", sender: self)
    }
}

//
//  PreviewVC.swift
//  POC
//
//  Created by Sai on 23/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {

    @IBOutlet weak var previewTable: UITableView!
    let dataManag = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Preview"
        // Do any additional setup after loading the view.
        previewTable.register(UINib(nibName: "PreviewCell", bundle: nil), forCellReuseIdentifier: "PreviewCell")
        previewTable.register(UINib(nibName: "consentFormPreviewCell", bundle: nil), forCellReuseIdentifier: "consentForm")

        self.dataManag.fetchDetails(wid: "6f13b5d3-11ef-4022-84d9-00d76237f9a7") { (response) in
            print(response)
//            self.submissionsData = response
            self.previewTable.reloadData()
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

extension PreviewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "consentForm", for: indexPath) as! consentFormPreviewCell
            return cell
        }
        else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
        //        cell.status.text = self.submissionsData[indexPath.row].status
        //        cell.businessName.text = self.submissionsData[indexPath.row].businessName
        //        cell.businessDNO.text = self.submissionsData[indexPath.row].businessDno
        //
        //        if indexPath.row == self.submissionsData.count - 1 {
        ////            if !(paginationView.indexPathsForVisibleRows?.contains(indexPath) ?? <#default value#>) {
        //              self.pageNumber = self.pageNumber + 1
        //              self.loadNextData()
        ////            }
        //        }
                return cell
                }
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "previewId", sender: self)
    }
}

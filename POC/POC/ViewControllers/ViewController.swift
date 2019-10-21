//
//  ViewController.swift
//  POC
//
//  Created by Sai on 18/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dataManag = DataManager()
    var submissionsData: [PaginationModel] = []

    @IBOutlet weak var paginationView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "My Submissions"
        
        self.dataManag.fetchList { (response) in
            print(response)
            self.submissionsData = response
            self.paginationView.reloadData()
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.submissionsData.count
//        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paginationCell", for: indexPath) as! paginationCell
        cell.status.text = self.submissionsData[indexPath.row].status
        cell.businessName.text = self.submissionsData[indexPath.row].businessName
        cell.businessDNO.text = self.submissionsData[indexPath.row].businessDno

//        if indexPath.row == self.paginationData.count - 1 {
//            self.loadNextData()
//        }
        return cell
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "attachmentsID", sender: self)
    }
}

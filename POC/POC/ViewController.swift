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
    @IBOutlet weak var paginationView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.paginationView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.paginationView.delegate = self
        self.paginationView.dataSource = self
        self.paginationView.reloadData()

        
        self.dataManag.fetchList { (response) in
            print(response)
//            self.paginationData = self.paginationData + response
//            print(self.paginationData)
//
//            sleep(1)
//            DispatchQueue.main.async {
//            self.paginationView.reloadData()
//                self.stopSpinner()
//            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.paginationData.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: TableViewCell = self.paginationView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.status.text = "In Progress"
        cell.businessName.text = "1344gsyehs#_&(_)$)_(/!\";'\"*!%"
        cell.businessDNO.text = "405, K P H B Phase 3, Kukatpally, Hyderabad, Telangana 500072, India"

//        if indexPath.row == self.paginationData.count - 1 {
//            self.loadNextData()
//        }
        return cell
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "attachmentsID", sender: self)
    }
}

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
    var detailObject : BusinessDetailModel?
    var previewImages = [String]()
    var businessID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Preview"
        // Do any additional setup after loading the view.
        previewTable.register(UINib(nibName: "PreviewCell", bundle: nil), forCellReuseIdentifier: "PreviewCell")
        previewTable.register(UINib(nibName: "consentFormPreviewCell", bundle: nil), forCellReuseIdentifier: "consentForm")
        previewTable.register(UINib(nibName: "ImagePreviewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
        previewTable.register(UINib(nibName: "AddImagePreviewCell", bundle: nil), forCellReuseIdentifier: "addImage")

        self.dataManag.fetchEachBusinessDetails(with: businessID!) { (response) in
            print(response)
            self.detailObject = BusinessDetailModel (businessModel: response)
            self.previewImages = self.detailObject?.images ?? []
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
        return 3 + self.previewImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
            cell.businessName.text = self.detailObject?.businessName
            cell.businessDNo.text = self.detailObject?.businessDno
            cell.category1.text = self.detailObject?.category1
            cell.category2.text = self.detailObject?.category2

            cell.locality.text = self.detailObject?.locality
            cell.city.text = self.detailObject?.city
            cell.state.text = self.detailObject?.state
            cell.pincode.text = self.detailObject?.pincode
            cell.country.text = self.detailObject?.country

            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addImage", for: indexPath) as! AddImagePreviewCell
            return cell
        } else if indexPath.row == self.previewImages.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "consentForm", for: indexPath) as! consentFormPreviewCell
            if let decodedData = Data(base64Encoded: self.detailObject?.selfie ?? "", options: .ignoreUnknownCharacters) {
                let image = UIImage(data: decodedData)
                cell.selfie_img.image = image
            }
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
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImagePreviewCell
            if let decodedData = Data(base64Encoded: self.detailObject?.images?[indexPath.row - 2] ?? "", options: .ignoreUnknownCharacters) {
                let image = UIImage(data: decodedData)
                cell.img_img.image = image
            }
            return cell
        }
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 754
        }
        else if indexPath.row == 1{
            return 50
        } else if indexPath.row == self.previewImages.count + 2 {
            return 780
        } else {
            return 560
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "previewId", sender: self)
    }
}

//
//  RequestManager.swift
//  TeamLease
//
//  Created by Selvam on 30/08/19.
//  Copyright © 2019 com.TeamLeasev2. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    func fetchList(pageNumber: Int, complitionHandler: @escaping(_ response:[MySubmissionsModel]) -> Void) {
        // Check network connectivity
        if isConnectedToInternet() {
            let headers: HTTPHeaders = [
                     "realm": "fos",
                     "Content-Type": "application/json",
                     "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIzVGFieDhndGtDSzZDWGtHQzgtUFBPblR5cVlQNnJKZFJqNkRRQVp1N3NFIn0.eyJqdGkiOiI5MmU2NmM2NC1mNTVmLTQyOTQtODMwNS01NzdiNmRjNjU4ZDciLCJleHAiOjE1Njk5OTk5MDUsIm5iZiI6MCwiaWF0IjoxNTY5OTk5ODQ1LCJpc3MiOiJodHRwczovL2FwcHMuZGF0YW1pbWUuY29tL2F1dGgvcmVhbG1zL21hc3RlciIsImF1ZCI6ImFkbWluLWNsaSIsInN1YiI6IjI4YzM5YTlkLWQ2MjItNDU4OC05MjNlLTRhODE5ZWJjNDM2ZCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFkbWluLWNsaSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6IjQ2ZWNlOTQwLTIxZGMtNGM2Mi1hNGJjLTQ0NTk3OTNhM2QzNCIsImFjciI6IjEiLCJhbGxvd2VkLW9yaWdpbnMiOltdLCJyZXNvdXJjZV9hY2Nlc3MiOnt9LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJ6ZW4zIGFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiemVuMyIsImZhbWlseV9uYW1lIjoiYWRtaW4iLCJlbWFpbCI6Im5hbWFuLnBAemVuMy5jb20ifQ.iE1sHh88dXz-8eTam4gmh_bd7JK_O0IP0iWFTVPIZqvuHo55LFIYtIHjaHu0Cg4mYywe8J8QUQj8oCo6oh-tIwFxj-n43f_q0voR0H_-W-DyZ0ygyc__kJ8p9_Q1p_ClFmghJiattD-IusvQXtKdsyfzINY7mBFOobtYnlsa2sg6oANrSwkvRIoPhl79TZwkgopVKGqrGFG4lFgNqfoVBka9GiTOsKRPLZRmbIDQ9SSbqPTQVZO0xG0RnI9Pdm4vWuIPRWU-N-ykd52tIer17zDlavTO07UU3QfN_Rs5sbZ-T00J0oa8NMaGcnNuhFAjJmGjOt-Acdb_M168Fec60g"
                 ]
        let todoEndpoint: String = "https://securedev.datamime.com/fos/api/v1/listings?pageNo=\(pageNumber)&pageSize=10"
            
            AF.request(todoEndpoint, headers:headers).responseJSON { response in
                     // check for errors
                     guard response.error == nil else {
                       // got an error in getting the data, need to handle it
                       print("error calling GET on /todos/1")
                       print(response.error!)
                       return
                     }

                     // make sure we got some JSON since that's what we expect
                guard let json = response.value as? [[String: Any]] else {
                       print("didn't get todo object as JSON from API")
                       if let error = response.error {
                         print("Error: \(error)")
                       }
                       return
                     }
                           do {
                            let responseData = try JSONDecoder().decode([MySubmissionsModel].self, from: response.data!)
                            complitionHandler (responseData)
                           } catch {
                               print(error.localizedDescription)
                           }
                 }
         }
    }
    
    func fetchDetails(wid: String, complitionHandler: @escaping(_ response:PreviewModel) -> Void) {
        // Check network connectivity
        if isConnectedToInternet() {
            let headers: HTTPHeaders = [
                     "realm": "fos",
                     "Content-Type": "application/json",
                     "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIzVGFieDhndGtDSzZDWGtHQzgtUFBPblR5cVlQNnJKZFJqNkRRQVp1N3NFIn0.eyJqdGkiOiI5MmU2NmM2NC1mNTVmLTQyOTQtODMwNS01NzdiNmRjNjU4ZDciLCJleHAiOjE1Njk5OTk5MDUsIm5iZiI6MCwiaWF0IjoxNTY5OTk5ODQ1LCJpc3MiOiJodHRwczovL2FwcHMuZGF0YW1pbWUuY29tL2F1dGgvcmVhbG1zL21hc3RlciIsImF1ZCI6ImFkbWluLWNsaSIsInN1YiI6IjI4YzM5YTlkLWQ2MjItNDU4OC05MjNlLTRhODE5ZWJjNDM2ZCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFkbWluLWNsaSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6IjQ2ZWNlOTQwLTIxZGMtNGM2Mi1hNGJjLTQ0NTk3OTNhM2QzNCIsImFjciI6IjEiLCJhbGxvd2VkLW9yaWdpbnMiOltdLCJyZXNvdXJjZV9hY2Nlc3MiOnt9LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJ6ZW4zIGFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiemVuMyIsImZhbWlseV9uYW1lIjoiYWRtaW4iLCJlbWFpbCI6Im5hbWFuLnBAemVuMy5jb20ifQ.iE1sHh88dXz-8eTam4gmh_bd7JK_O0IP0iWFTVPIZqvuHo55LFIYtIHjaHu0Cg4mYywe8J8QUQj8oCo6oh-tIwFxj-n43f_q0voR0H_-W-DyZ0ygyc__kJ8p9_Q1p_ClFmghJiattD-IusvQXtKdsyfzINY7mBFOobtYnlsa2sg6oANrSwkvRIoPhl79TZwkgopVKGqrGFG4lFgNqfoVBka9GiTOsKRPLZRmbIDQ9SSbqPTQVZO0xG0RnI9Pdm4vWuIPRWU-N-ykd52tIer17zDlavTO07UU3QfN_Rs5sbZ-T00J0oa8NMaGcnNuhFAjJmGjOt-Acdb_M168Fec60g"
                 ]
        let todoEndpoint: String = "https://securedev.datamime.com/fos/api/v1/listings/\(wid)"
            
            AF.request(todoEndpoint, headers:headers).responseJSON { response in
                     // check for errors
                     guard response.error == nil else {
                       // got an error in getting the data, need to handle it
                       print("error calling GET on /todos/1")
                       print(response.error!)
                       return
                     }

                     // make sure we got some JSON since that's what we expect
                guard let json = response.value as? [String: Any] else {
                       print("didn't get todo object as JSON from API")
                       if let error = response.error {
                         print("Error: \(error)")
                       }
                       return
                     }
                           do {
                            let responseData = try JSONDecoder().decode(PreviewModel.self, from: response.data!)

//                            let responseData = try JSONDecoder().decode(PreviewModel.self, from: response.data!)
                            complitionHandler (responseData)
                           } catch {
                               print(error.localizedDescription)
                           }
                 }
         }

    }
}

//MARK: Network reachability
extension DataManager {
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

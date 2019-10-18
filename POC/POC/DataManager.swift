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
    
    func fetchList(complitionHandler: @escaping(_ response:[[String: Any]]) -> Void) {
        
        // Check network connectivity
        if isConnectedToInternet() {
//                 let headers = [
//                     "realm": "fos",
//                     "Content-Type": "application/json"
//                 ]
        let todoEndpoint: String = "https://securedev.datamime.com/fos/api/v1/listings?pageNo=1&pageSize=10"
            
                   AF.request(todoEndpoint).responseJSON { response in
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
//                                   let responseData = try JSONDecoder().decode(EmployeeModel.self, from: response.data!)
//                            complitionHandler ([[String : Any]])
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

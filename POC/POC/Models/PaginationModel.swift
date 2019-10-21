//
//  MySubmissionsModel.swift
//  POC
//
//  Created by Sai on 21/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import Foundation

struct MySubmissionsModel: Codable {
    let wid: String
    let created_on: String
    let modified_on: String
    let businessDno: String
    let businessName: String
    let status: String
}

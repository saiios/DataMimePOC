//
//  BusinessDetailModel.swift
//  POC
//
//  Created by Selvam on 22/10/19.
//  Copyright © 2019 sai. All rights reserved.
//

import Foundation

struct BusinessDetailModel: Codable {
    let wid: String!
    let businessDno: String!
    let businessName: String?
    let category1: String?
    let category2: String?
    let city: String!
    let consent: Bool?
    let country: String!
    let fireExit: Bool?
    let firstAid: Bool?
    let imageDate: [String]?
    let images: [String]?
    let latitude: String!
    let locality: String!
    let parking: Bool?
    let pincode: String!
    let restroom: Bool?
    let selfie: String?
    let state: String!
    let status: String?
    let timings: String?
    let userId: String!
    let wheelChair: Bool?
}

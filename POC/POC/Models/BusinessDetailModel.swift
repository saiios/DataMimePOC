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
    let imageDate: String?
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
    
    init(businessModel: BusinessDetailModel) {
        self.wid = businessModel.wid
        self.businessDno = businessModel.businessDno
        self.businessName = businessModel.businessName
        self.category1 = businessModel.category1
        self.category2 = businessModel.category2
        self.city = businessModel.city
        self.consent = businessModel.consent
        self.country = businessModel.country
        self.fireExit = businessModel.fireExit
        self.firstAid = businessModel.firstAid
        self.imageDate = businessModel.imageDate
        self.images = businessModel.images
        self.latitude = businessModel.latitude
        self.locality = businessModel.locality
        self.parking = businessModel.parking
        self.pincode = businessModel.pincode
        self.restroom = businessModel.restroom
        self.selfie = businessModel.selfie
        self.state = businessModel.state
        self.status = businessModel.status
        self.timings = businessModel.timings
        self.userId = businessModel.userId
        self.wheelChair = businessModel.wheelChair
    }
}

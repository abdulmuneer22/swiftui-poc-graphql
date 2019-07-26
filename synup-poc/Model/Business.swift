//
//  Business.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftUI



struct LocationPhoto {
    let url : String
}



struct Business {
    let id: String
    let name: String
    let street: String
    let city : String
    let state_name: String
    let postal_code : String
    let phone: String
    let latitude: String
    let longitude: String
    let biz_url : String
    let owner_name: String
    let facebook_url: String
    let twitter_url: String
    let description : String
    let tagline: String
    let additional_info: String
    let year_of_incorporation: String
    let sub_category_id: Int
    let hide_address: Bool
    let business_logo: String
    let business_cover: String
    let ownerEmail : String
    let locationPhotos : [LocationPhoto]
    
    
    //    let business_hours : [BusinessHour]?
    
}





//struct Business: Codable {
//    let name: String?
//    let street: String?
//    let city : String?
//    let state_name: String?
//    let postal_code : String?
//    let phone: String?
//    let latitude: String?
//    let longitude: String?
//    let biz_url : String?
//    let owner_name: String?
//    let facebook_url: String?
//    let twitter_url: String?
//    let description : String?
//    let business_hours : [BusinessHour]?
//    let tagline: String?
//    let additional_info: String?
//    let year_of_incorporation: String?
//    let sub_category_id: Int?
//    let hide_address: Bool?
//    let business_logo: String?
//    let business_cover: String?
//
//    init(
//        name: String? = "",
//        street: String? = "",
//        city: String? = "",
//        state_name: String? = "",
//        postal_code: String? = "",
//        phone: String? = "",
//        latitude: String = "",
//        longitude: String = "",
//        biz_url: String = "",
//        owner_name: String = "",
//        facebook_url: String = "",
//        twitter_url: String = "",
//        description: String = "",
//        tagline: String = "",
//        additional_info: String = "",
//        year_of_incorporation : String = "",
//        sub_category_id : Int = 0,
//        hide_address: Bool = false,
//        business_logo : String = "",
//        business_cover: String = "",
//        business_hours: [BusinessHour]?
//        )
//    {
//        self.name = name
//        self.street = street
//        self.city = city
//        self.state_name = state_name
//        self.business_hours = business_hours
//        self.postal_code = postal_code
//        self.phone = phone
//        self.latitude = latitude
//        self.longitude = longitude
//        self.biz_url = biz_url
//        self.owner_name = owner_name
//        self.facebook_url = facebook_url
//        self.twitter_url = twitter_url
//        self.description = description
//        self.tagline = tagline
//        self.additional_info = additional_info
//        self.year_of_incorporation = year_of_incorporation
//        self.sub_category_id = sub_category_id
//        self.hide_address = hide_address
//        self.business_logo = business_logo
//        self.business_cover = business_cover
//    }
//}
//
//struct BusinessHour : Codable {
//    let day : String?
//    let start_time : String?
//    let end_time : String?
//}

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







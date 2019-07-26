//
//  GraphQueries.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftUI



class GraphQueries : BindableObject {
    var willChange = PassthroughSubject<GraphQueries,Never>()
    
    var businesses = [Business](){
        didSet {
            willChange.send(self)
        }
    }
    
    
    
    
    
    func getBusinessData(queryString: String) {
        apollo.fetch(query: SearchLocationsQuery(query: queryString)) {
            (result,error) in
            if let resultMap = result?.data?.resultMap {
                let accountData = JSON(resultMap)
                let payload = accountData["searchLocations"]["edges"].arrayValue
                var businessSuggestions : [Business] = []
                
                for business in payload {
                    let data = business["node"]
                    let id = data["id"].stringValue
                    let name = data["name"].stringValue
                    let street = data["street"].stringValue
                    let city = data["city"].stringValue
                    let state_name = data["state_name"].stringValue
                    let postal_code = data["postal_code"].stringValue
                    let phone = data["phone"].stringValue
                    let latitude = data["latitude"].stringValue
                    let longitude = data["longitude"].stringValue
                    let biz_url = data["biz_url"].stringValue
                    let owner_name = data["owner_name"].stringValue
                    let facebook_url = data["facebook_url"].stringValue
                    let twitter_url = data["twitter_url"].stringValue
                    let description = data["description"].stringValue
                    let tagline = data["tagline"].stringValue
                    let additional_info = data["additional_info"].stringValue
                    let year_of_incorporation = data["year_of_incorporation"].stringValue
                    let sub_category_id = data["sub_category_id"].intValue
                    let hide_address = data["hide_address"].boolValue
                    let business_logo = data["business_logo"].stringValue
                    let business_cover = data["business_cover"].stringValue
                    let ownerEmail = data["ownerEmail"].stringValue
                    
                    let locationPhotos = data["locationPhotos"].arrayValue
                    var photos : [LocationPhoto] = []
                    
                    for photo in locationPhotos {
                        let locationPhoto = LocationPhoto(url: photo["url"].stringValue)
                        photos.append(locationPhoto)
                        
                    }
                    
                    
                    
                    let business = Business(id: id, name: name, street: street, city: city, state_name: state_name, postal_code: postal_code, phone: phone, latitude: latitude, longitude: longitude, biz_url: biz_url, owner_name: owner_name, facebook_url: facebook_url, twitter_url: twitter_url, description: description, tagline: tagline, additional_info: additional_info, year_of_incorporation: year_of_incorporation, sub_category_id: sub_category_id, hide_address: hide_address, business_logo: business_logo, business_cover: business_cover, ownerEmail: ownerEmail, locationPhotos: photos)
                    
                    
                    businessSuggestions.append(business)
                }
                // trigger a state modification
                DispatchQueue.main.async {
                    self.businesses = businessSuggestions
                }
            }
        }
    }
    
}


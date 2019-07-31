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


var businessesPublisher  = PassthroughSubject<[Business],Never>()


class GraphQueries : NSObject {
    
    func getBusinessData(queryString: String) {
        apollo.fetch(query: SearchLocationsQuery(query: queryString)) {
            (result,error) in
            if let resultMap = result?.data?.resultMap {
                let accountData = JSON(resultMap)
                let payload = accountData["searchLocations"]["edges"].arrayValue
                var businessSuggestions : [Business] = []
                let reviews : [Interaction] = []
                
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
                    
                    
                    
                    let business = Business(id: id, name: name, street: street, city: city, state_name: state_name, postal_code: postal_code, phone: phone, latitude: latitude, longitude: longitude, biz_url: biz_url, owner_name: owner_name, facebook_url: facebook_url, twitter_url: twitter_url, description: description, tagline: tagline, additional_info: additional_info, year_of_incorporation: year_of_incorporation, sub_category_id: sub_category_id, hide_address: hide_address, business_logo: business_logo, business_cover: business_cover, ownerEmail: ownerEmail, locationPhotos: photos,reviews: reviews)
                    
                    
                    businessSuggestions.append(business)
                }
                // trigger a state modification
                DispatchQueue.main.async {
                    businessesPublisher.send(businessSuggestions)
                }
            }
        }
    }
    
    
    func getInteractions(locationId: String){
        apollo.fetch(query: GetInteractionsQuery(locationId: locationId)){
            (result,error) in
            if let resultMap = result?.data?.resultMap {
                let locationData = JSON(resultMap)
                let payload = locationData["interactions"]["edges"].arrayValue
                var interactions : [Interaction] = []
                for interaction in payload {
                    
                    let id = interaction["node"]["id"].stringValue
                    let title = interaction["node"]["title"].stringValue
                    let content =  interaction["node"]["content"].stringValue
                    let source = interaction["node"]["source"].stringValue
                    let authorName = interaction["node"]["authorName"].stringValue
                    let authorAvatar = interaction["node"]["authorAvatar"].stringValue
                    let rating = interaction["node"]["rating"].intValue
                    let date = interaction["node"]["date"].stringValue
                    let photoUrl = interaction["node"]["photoUrl"].stringValue
                    let photoThumbnailUrl = interaction["node"]["photoThumbnailUrl"].stringValue
                    
                    
                    
                    let _interaction = Interaction(id : id, title: title, content: content, source: source, authorName: authorName, authorAvatar: authorAvatar, rating: rating, date: date, photoUrl: photoUrl, photoThumbnailUrl: photoThumbnailUrl)
                    
                    interactions.append(_interaction)
                    
                }
                // trigger a state modification
                DispatchQueue.main.async {
//                    self.interactions = interactions
                }
            }
        }
    }
    
}


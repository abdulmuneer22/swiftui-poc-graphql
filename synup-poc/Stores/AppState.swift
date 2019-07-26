//
//  AppStatePublisher.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//





import Combine
import SwiftUI




class AppStateStore: BindableObject {
    
//    var selectedBusiness: Business = Business(id: "String", name: "String", street: "", city: "", state_name: "", postal_code: "", phone: "", latitude: "", longitude: "", biz_url: "", owner_name: "", facebook_url: "", twitter_url: "", description: "", tagline: "", additional_info: "", year_of_incorporation: "", sub_category_id: 0, hide_address: false, business_logo: "", business_cover: "", ownerEmail: ""
//    )
    
    
    var willChange = PassthroughSubject<AppStateStore,Never>()
    
    
    var selectedBusiness : Business?
    
    
    func selectBusiness(business: Business){
        selectedBusiness = business
        willChange.send(self)
    }
    
    
    
}

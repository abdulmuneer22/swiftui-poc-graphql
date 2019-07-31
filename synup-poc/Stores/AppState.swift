//
//  AppStatePublisher.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//





import Combine
import SwiftUI

class AppStateStore: ObservableObject {
    
    // user can search for businesses , this one represents the one he selected at given poit of time
    var selectedBusiness : Business?
    
    // user can switch between tabs , this one represents the tab selected , this is a two way binding
    @Published
    var selectedTab : Int = 1
    
    func selectBusiness(business: Business){
        selectedBusiness = business
    }
    
    
    
    
    
    
}

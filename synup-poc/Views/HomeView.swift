//
//  ContentView.swift
//  tinder-clone
//
//  Created by synup on 11/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI
import UIKit
import Combine





let keyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first

struct HomeView : View {
    
    
    @State var graphHandler : GraphQueries = GraphQueries()
    
    @State var didSelectBusiness : Bool = false
    
    @State var searchInProgress : Bool = false
    
    @State var showSearchResults : Bool = false
    
    @State var appState : AppStateStore = AppStateStore()
    
    
    
    
    
    
    
    @State var businessSuggestions : [Business] = [Business]()
    @State var isLoading : Bool = false
    
    
    
    //    @State var selectedBusiness : Business = Business(id: "", name: "Random Bookshop", street: "#12", city: "Bangalore", state_name: "Karnataka", postal_code: "560078", phone: "+98424243", latitude: "", longitude: "", biz_url: "https://fb.com/randomshop", owner_name: "James Franco", facebook_url: "https://fb.com/randomshop", twitter_url: "https://tw.com/randomshop", description: "Some Random shop for display purpose", tagline: "my random shop", additional_info: "No Additional Info Found", year_of_incorporation: "1900", sub_category_id: 0, hide_address: false, business_logo: "", business_cover: "", ownerEmail: "owner@nodomain.com", locationPhotos: [LocationPhoto(url: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5577569ce4b017853ece68b2%2F400x400.jpg%3Ffit%3Dscale%26background%3D000000")])
    
    
    
    
    /******* Subscribers *****/
    
    
    
    
    
    
    var body : some View {
        
        return VStack {
            
            SearchBar(appState: $appState)
            
            if !self.showSearchResults && !self.didSelectBusiness {
                Spacer()
            }
            
            if self.showSearchResults {
                SearchResults(didSelectBusiness: $didSelectBusiness, graphHandler: $graphHandler, showSearchResults: $showSearchResults, appState: $appState, businessNames: $businessSuggestions)
            }
//
            
            
            if self.didSelectBusiness {
                SelectedBusinessView(appState : $appState,graphHandler: $graphHandler)
            }
            
            
            
            
        }.onReceive(searchTextPublisher) { (Value) in
            
            if(Value.count > 3){
                self.graphHandler.getBusinessData(queryString: Value)
                self.didSelectBusiness = false
                self.isLoading = true
            }
            
        }.onReceive(businessesPublisher) { (businesses) in
            self.businessSuggestions = businesses
            self.showSearchResults = true
            self.isLoading = false
        }
        
    }
    
    
    
    
}


struct businessName {
    var name: String = ""
    var id : String = "0"
}


struct SearchResults : View {
    
    @Binding var didSelectBusiness : Bool
    @Binding var graphHandler: GraphQueries
    @Binding var showSearchResults: Bool
    @Binding var appState : AppStateStore
////
    @Binding var businessNames : [Business]
    
    
    
    
    
    var body : some View {
        List(businessNames,id: \.id){ business in
            Button(action: {
                self.didSelectBusiness = true
                self.showSearchResults = false
                // query for interactions here
                self.graphHandler.getInteractions(locationId: business.id)
                print(business)
                businessNamePublisher.send(business)
                keyWindow?.endEditing(true)
            }){
                Text(business.name)
            }
            
        }
    }
}







#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif





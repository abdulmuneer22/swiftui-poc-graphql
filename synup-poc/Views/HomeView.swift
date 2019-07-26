//
//  ContentView.swift
//  tinder-clone
//
//  Created by synup on 11/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI
import UIKit



struct HomeView : View {
    
    @State private var searchQuery: String = ""
    @State private var graphHandler: GraphQueries = GraphQueries()
    @State private var selectedIndex : String = ""
    
    
    @EnvironmentObject var appState : AppStateStore
    
    
    
    var body: some View {
        
            Search(searchText: "")
            
            
            
            if appState.showSearchResults {
                
                List(self.graphHandler.businesses,id: \.id){  business in
                    VStack{
                        Button(action: {
                            self.appState.selectBusiness(business: business)
                            self.appState.showSearchResults = false
                            self.graphHandler.businesses = []
//                            UIApplication.shared.keyWindow?.endEditing(true)
                        }) {
                            Text(business.name)
                        }
                        
                    }
                    
                }
            }
            
            
            
            
            if appState.selectedBusiness != nil {
                TabbedViewItems(appState: _appState)
            }else{
                Spacer()
            }
            
            
        }
        
        
        
    }
    
    
    
}





struct InformationView : View {
    @EnvironmentObject var appState : AppStateStore
    
    var body : some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Business Name : \(self.appState.selectedBusiness?.name ?? "")")
                Text("Owner Email : \(self.appState.selectedBusiness?.ownerEmail ?? "")")
                Text("Street : \(self.appState.selectedBusiness?.street ?? "")")
                Text("City : \(self.appState.selectedBusiness?.city ?? "")")
                Text("State Name : \(self.appState.selectedBusiness?.state_name ?? "")")
                Text("Postal Code : \(self.appState.selectedBusiness?.postal_code ?? "")")
                Text("Phone Number : \(self.appState.selectedBusiness?.phone ?? "")")
                
                if (self.appState.selectedBusiness?.locationPhotos.count ?? 0) > 0 {
                    ImageWidget(imageUrl: (self.appState.selectedBusiness?.locationPhotos[0].url) ?? "")
                }
                
                
            }
            
        }
    }
}




struct BusinessInformation : View {
    @State var business : Business
    var body: some View {
        return Text(business.name)
    }
}

struct BusinessDetails : View {
    @State var business : Business
    var body: some View {
        return Text("Business Details")
    }
}


struct OperationHours : View {
    @State var business : Business
    var body: some View {
        return Text("Operation Hours Details")
    }
}


struct Media : View {
    @State var business : Business
    var body: some View {
        return Text("Media Items")
    }
}




#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif

struct TabbedViewItems : View {
    
    @EnvironmentObject var appState : AppStateStore
    
    var body: some View {
        return TabbedView {
            InformationView(appState: _appState)
                .tabItem({
                    VStack{
                        Text("Information")
                        Image(systemName: "info")
                    }
                })
                .tag(0)
            
            
            Text("2")
                .tabItem({
                    VStack{
                        Text("2")
                        Image(systemName: "arrow.up.right.circle.fill")
                    }
                })
                .tag(1)
            
            
            
            Text("3")
                .tabItem({
                    VStack{
                        Text("3")
                        Image(systemName: "rectangle.stack.person.crop")
                    }
                })
                .tag(2)
            
            Text("4")
                .tabItem({
                    VStack{
                        Text("4")
                        Image(systemName: "camera.fill")
                        
                    }
                })
                .tag(3)
        }
    }
}

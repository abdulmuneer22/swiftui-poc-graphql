//
//  SelectedBusinessView.swift
//  synup-poc
//
//  Created by synup on 26/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI

struct SelectedBusinessView : View {
    @Binding var appState : AppStateStore
    
    var body: some View {
        TabbedViewItems(appState : $appState)
    }
}



struct BusinessDataView : View {
    
    @Binding var appState : AppStateStore
    
    var body : some View {
        GeometryReader { geometry in
            
            ScrollView() {
                
                VStack(alignment: .leading){
                    if (self.appState.selectedBusiness?.locationPhotos.count ?? 0) > 0 {
                        ImageWidget(imageUrl: (self.appState.selectedBusiness?.locationPhotos[0].url) ?? "")
                    }
                    
                    Text("Business Name : \(self.appState.selectedBusiness?.name ?? "")")
                    Text("Owner Email : \(self.appState.selectedBusiness?.ownerEmail ?? "")")
                    Text("Street : \(self.appState.selectedBusiness?.street ?? "")")
                    Text("City : \(self.appState.selectedBusiness?.city ?? "")")
                    Text("State Name : \(self.appState.selectedBusiness?.state_name ?? "")")
                    Text("Postal Code : \(self.appState.selectedBusiness?.postal_code ?? "")")
                    Text("Phone Number : \(self.appState.selectedBusiness?.phone ?? "")")
                    
                }.padding()
                
                
                
                
            }
            
        }
    }
}





struct TabbedViewItems : View {
    
    
    @Binding var appState : AppStateStore
    
    var body: some View {
        return TabbedView {
            BusinessDataView(appState : $appState)
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

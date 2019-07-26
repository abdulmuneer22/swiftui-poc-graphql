//
//  Search.swift
//  synup-poc
//
//  Created by synup on 24/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI

struct Search : View {
    @State var searchText = ""
    
    var body: some View {
        TextField($searchText,placeholder:Text("Start Typing To Search"))
        .textFieldStyle(.roundedBorder)
        .border(Color.white, width: 0,cornerRadius: 16)
        .frame(width: 400, height: 40)
        
    }
}



//struct Search : View {
//    @State var searchText: String
//    @Binding var graphHandler: GraphQueries
//
//    @EnvironmentObject var appState : AppStateStore
//
//    var body: some View {
//
//        TextField($searchText,placeholder: Text("Search Here"),onEditingChanged: {
//            (Bool) in
//            if(self.searchText.count > 3){
//                self.graphHandler.getBusinessData(queryString: self.searchText)
//                                self.appState.showSearchResults = true
//            }
//        })
//
////        TextField("Search Text", text: $searchText)
//
//
//    }
//}
//
//
//

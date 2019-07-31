//
//  Search.swift
//  synup-poc
//
//  Created by synup on 24/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI

struct Search : View {
    @Binding var searchText : String
    
    @Binding var graphHandler: GraphQueries
    @Binding var searchInProgress : Bool
    
    var body: some View {
        TextField("Search Here" , text: $searchText)
            .textFieldStyle(.roundedBorder)
            .border(Color.white, width: 0,cornerRadius: 16)
            .frame(width: 400, height: 40)
        //
        
        
        
    }
}


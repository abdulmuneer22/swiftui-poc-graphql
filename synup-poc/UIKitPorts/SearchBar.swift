//
//  SearchBar.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import SwiftUI
import Combine



let searchTextPublisher = PassthroughSubject<String,Never>()
let businessNamePublisher = PassthroughSubject<Business,Never>()







struct SearchBar : UIViewRepresentable {
    
    @Binding var appState : AppStateStore
    
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let sb = UISearchBar()
        sb.placeholder = "What are you searching for ?"
        sb.barTintColor = .white
        sb.searchTextField.backgroundColor = UIColor(hue: 0.3389, saturation: 0, brightness: 0.97, alpha: 1.0)
        sb.layer.borderWidth = 10
        sb.layer.borderColor = UIColor.white.cgColor
        sb.searchBarStyle = UISearchBar.Style.prominent
        
        // delegation
        sb.delegate = context.coordinator
        return sb
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = appState.selectedBusiness?.name
        // update view here
        // setting a listener for action to clear ui searchbar text
        //        _ = businessNamePublisher
        //            .sink(receiveValue: { (value) in
        //                uiView.text = value.name
        //            })
        //        uiView.text = businessSelected.name
        
        
        //
    }
    
    func makeCoordinator() -> Cordinator {
        return Cordinator()
    }
    
    typealias UIViewType = UISearchBar
    
    
    
}

class Cordinator : NSObject , UISearchBarDelegate {
    
    @Published var userTextEntry : String = ""
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // publish searchtext changes here
        
        searchTextPublisher.send(searchText)
        
    }
    
}



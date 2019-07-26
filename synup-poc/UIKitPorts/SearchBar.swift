////
////  SearchBar.swift
////  synup-poc
////
////  Created by synup on 12/07/19.
////  Copyright © 2019 synup. All rights reserved.
////
//
//import UIKit
//import SwiftUI
//
//
//struct SearchBar : UIViewRepresentable {
//    
//    @Binding var text: String
//    @Binding var graphHandler : GraphQueries
//    
//    @Binding var appState : AppStateStore
//    
//    
//    
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//        let sb = UISearchBar()
//        sb.placeholder = "What are you searching for ?"
//        sb.barTintColor = .white
//        sb.searchTextField.backgroundColor = UIColor(hue: 0.3389, saturation: 0, brightness: 0.97, alpha: 1.0)
//        sb.layer.borderWidth = 10
//        sb.layer.borderColor = UIColor.white.cgColor
//        sb.searchBarStyle = UISearchBar.Style.prominent
//        
//        // delegation
//        sb.delegate = context.coordinator
//        return sb
//    }
//    
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        if(appState.selectedBusiness != nil){
//            uiView.text = text
//        }else{
//            uiView.text = nil
//        }
//        
//    }
//    
//    func makeCoordinator() -> Cordinator {
//        return Cordinator(text: $text,graphHandler: $graphHandler)
//    }
//    
//    typealias UIViewType = UISearchBar
//    
//    
//    
//}
//
//class Cordinator : NSObject , UISearchBarDelegate {
//    @Binding var text: String
//    @Binding var graphHandler : GraphQueries
//    
//    
//    
//    @EnvironmentObject var appState : AppStateStore
//    
//    
//    
//    
//    init(text : Binding<String>, graphHandler : Binding<GraphQueries>) {
//        $text = text
//        $graphHandler = graphHandler
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        text = searchText
//        
//        // do api call here
//        if(searchText.count > 3){
//            graphHandler.getBusinessData(queryString: searchText)
//            appState.showSearchResults = true
////            appState.selectedBusiness = nil
////            appState.toggleSearchModal(show: true)
//        }
//        
//        
//    }
//    
//}
//
//

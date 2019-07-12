//
//  ContentView.swift
//  tinder-clone
//
//  Created by synup on 11/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI
import UIKit



struct InformationView : View {
    var body : some View {
        Text("Information View")
    }
}


struct DetailsView : View {
    var body : some View {
        Text("Details View")
    }
}


struct OperationHours : View {
    var body : some View {
        Text("Operation Hours View")
    }
}


struct MediaItems : View {
    var body : some View {
        Text("Media Items View")
    }
}


struct SearchBar : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let sb = UISearchBar()
        sb.placeholder = "What are you searching for ?"
        sb.barTintColor = .white
        sb.searchTextField.backgroundColor = UIColor(hue: 0.3389, saturation: 0, brightness: 0.97, alpha: 1.0)
        sb.layer.borderWidth = 10
        sb.layer.borderColor = UIColor.white.cgColor
        sb.searchBarStyle = UISearchBar.Style.prominent
        return sb
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
    }
    
    typealias UIViewType = UISearchBar
    
}


struct HomeView : View {
    var body: some View {
        VStack {
            HStack{
                SearchBar()
            }
            
            TabbedView {
                InformationView()
                    .tabItem({
                        VStack{
                            Text("Information")
                            Image(systemName: "info")
                        }
                    })
                    .tag(0)
                
                
                DetailsView()
                    .tabItem({
                        VStack{
                            Text("Details")
                            Image(systemName: "arrow.up.right.circle.fill")
                        }
                    })
                    .tag(1)
                
                
                
                OperationHours()
                    .tabItem({
                        VStack{
                            Text("Operations")
                            Image(systemName: "rectangle.stack.person.crop")
                        }
                    })
                    .tag(2)
                
                MediaItems()
                    .tabItem({
                        VStack{
                            Image(systemName: "camera.fill")
                            Text("Media")
                        }
                    })
                    .tag(3)
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

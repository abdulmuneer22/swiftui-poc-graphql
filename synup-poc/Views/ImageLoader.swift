//
//  ImageLoader.swift
//  synup-poc
//
//  Created by synup on 24/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader : ObservableObject {
    
    var data = Data()
    
    init(imageUrl : String) {
        // fetch image with URLSession Here
        guard let url = URL(string: imageUrl) else { return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
    
}


struct ImageWidget : View {
    @ObservedObject var imageLoader : ImageLoader
    
    init(imageUrl : String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body : some View {
        Image(uiImage: (imageLoader.data.count == 0 ? UIImage(named: "placeholder") :  UIImage(data: imageLoader.data)!)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

//
//  InteractionsView.swift
//  synup-poc
//
//  Created by synup on 29/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import SwiftUI


struct ReviewsCountCard : View {
    var body: some View {
        
        HStack{
            ReviewsCountSection(title: "No of Reviews", value: "35")
            ReviewsCountSection(title: "No of Reviews", value: "35")
            ReviewsCountSection(title: "No of Reviews", value: "35")
        }
        .padding(10)
            .background(Color.white)
        
    }
    
}



struct ReviewsCountSection : View {
    var title : String
    var value : String
    
    var body: some View {
        VStack {
            Text(title)
                .padding(5)
            Text(value)
                .font(.title)
            
        }
        
    }
}


struct ReviewCard: View {
    var interaction : Interaction
    
    var body: some View {
        GeometryReader {
            geometry in
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    ImageWidget(imageUrl: self.interaction.authorAvatar)
                        .frame(width: 60, height: 60, alignment: .center)
                    Text(self.interaction.authorName)
                    StarRatingComponent(rating: self.interaction.rating)
                    Text(self.interaction.date)
                    
                }
                .padding(10)
                
                VStack(alignment: .leading){
                    Text(self.interaction.content)
                        .lineLimit(nil)
                }
                .frame(width: geometry.size.width * 0.6 )
                    .padding(.top , 20)
            }.frame(width: geometry.size.width)
            
        }.frame(minHeight: 150)
        
    }
}



struct StarRatingComponent : View {
    var rating : Int = 5
    
    var body : some View {
        
        HStack {
            Image(systemName: rating > 0 ? "star.fill" : "star").foregroundColor(.blue)
            Image(systemName: rating > 1 ? "star.fill" : "star").foregroundColor(.blue)
            Image(systemName: rating > 2 ? "star.fill" : "star").foregroundColor(.blue)
            Image(systemName: rating > 3 ? "star.fill" : "star").foregroundColor(.blue)
            Image(systemName: rating > 4 ? "star.fill" : "star").foregroundColor(.blue)
        }
        
    }
}




struct InteractionsView: View {
    
    
    
    var body: some View {
        
        Text("Test")
//        List(graphHandler.interactions,id: \.id){ interaction in
//            ReviewCardWrapper(interaction: interaction)
//        }
        
        
        
    }
}


struct ReviewCardWrapper : View {
    var interaction : Interaction
    var body : some View {
        ReviewCard(interaction : interaction)
    }
}


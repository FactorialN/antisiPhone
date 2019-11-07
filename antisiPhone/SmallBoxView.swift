//
//  NewsBoxIView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct SmallBoxView: View {
    
    
    @State private var news = News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "j", display: "Wow", isShort: true)
    
    @State private var Radius = 15
    
    var newsI : News
    
    init (newsInit: News){
        newsI = newsInit
        
    }

    var body: some View {
        
        VStack {
                    
                   HStack {
                       VStack(alignment: .leading) {
                        
                        
                        Text(news.title)
                               .font(.title)
                               .fontWeight(.black)
                               .foregroundColor(.primary)
                               .lineLimit(3)
                        Text(news.author)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        //ScrollView{
                        Text(news.display)
                            .font(.body)
                               .foregroundColor(.secondary)
                        
                        }
        
                    
                       Spacer()
                   }
                   .padding()
               }
            

        .cornerRadius(CGFloat(15))
               .background(
                RoundedRectangle(cornerRadius: CGFloat(15))
                    .stroke(Color(.sRGB, red: 100/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 0)
                    .background((
                        Color(UIColor(named: "customBackgroundColor") ?? .white))
  .cornerRadius(CGFloat(15))
                        .shadow(radius: CGFloat(15))
                )
                
               )
            .padding(CGFloat(15))
    }
}

struct SmallBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SmallBoxView(newsInit: News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "Wowjdsahfjdkslahjfkdhsafhdjkslahfjdlshajlvdblvkbeqjfkb", display: "Wow", isShort: true))
    }
}

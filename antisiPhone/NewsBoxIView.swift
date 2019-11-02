//
//  NewsBoxIView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct NewsBoxIView: View {
    var news: News
    init (newsInit: News){
        news = newsInit
    }
    var body: some View {
        VStack {
                   Image("demopic")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
        
                   HStack {
                       VStack(alignment: .leading) {
                        Text(news.author)
                               .font(.headline)
                               .foregroundColor(.secondary)
                        Text(news.title)
                               .font(.title)
                               .fontWeight(.black)
                               .foregroundColor(.primary)
                               .lineLimit(3)
                        Text(news.short.uppercased())
                               .font(.caption)
                               .foregroundColor(.secondary)
                       }
                       .layoutPriority(100)
        
                       Spacer()
                   }
                   .padding()
               }
               .cornerRadius(15)
               .background(
            RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(.sRGB, red: 100/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 0)
                .background(
                    Color(UIColor(named: "customBackgroundColor") ?? .white)
                    .cornerRadius(15)
                    .shadow(radius: 15)
                )
               )
               .padding([.top])

    }
}

struct NewsBoxIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsBoxIView(newsInit: News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "j"))
    }
}

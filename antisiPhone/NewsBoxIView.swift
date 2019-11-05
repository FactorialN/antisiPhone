//
//  NewsBoxIView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct NewsBoxIView: View {
    
    @State private var state = 0
    
    @State private var news = News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "j", display: "Wow", isShort: true)
    
    @State private var Radius = 15
    
    @State private var content = ""
    
    @State private var xpos = 0
    
    @State private var ypos = 0
    
    @State private var bounds = UIScreen.main.bounds
    @State var width : CGFloat = 0
    @State var height : CGFloat = 0
    @State var minHeight : CGFloat = 0
    
    var newsI : News
    
    init (newsInit: News){
        newsI = newsInit
        
    }

    var body: some View {
        
        VStack {
            
                   Image("demopic")
                       .resizable()
            .scaledToFit()
                    //.aspectRatio(1, contentMode: .fit)
            .layoutPriority(100)
                    .zIndex(10)
                    
        
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
                        ScrollView{
                        Text(news.display)
                            .font(.body)
                               .foregroundColor(.secondary)
                        
                        }
                        .frame(height:
                            ((self.state==0) ?(self.height*0.05):(self.height*0.15)))
                       }
                       .layoutPriority(99)
                    
                       Spacer()
                   }
                   .padding(EdgeInsets(top: self.state==1 ? -self.height*0.08 : 15, leading: 15, bottom: 15, trailing: 15))
               }
            

        .cornerRadius(CGFloat(Radius))
               .background(
                RoundedRectangle(cornerRadius: CGFloat(Radius))
                    .stroke(Color(.sRGB, red: 100/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 0)
                    .background((self.state == 0 ?
                        Color(UIColor(named: "customBackgroundColor") ?? .white) : Color(UIColor(named: "customBackgroundColor") ?? .white))
                        .cornerRadius(CGFloat(Radius))
                        .shadow(radius: CGFloat(Radius))
                )
                
               )
            //.position(x: CGFloat(self.xpos), y: 0)
            .padding(CGFloat(Radius))
            .edgesIgnoringSafeArea(.all)
            //.frame(minWidth: 0, maxWidth: .infinity, minHeight: self.minHeight,  maxHeight: .infinity, alignment: .topLeading)
            .statusBar(hidden: (self.state==1))
            .onAppear {
                self.news = self.newsI
                self.content = self.news.short
                self.width = self.bounds.size.width
                self.height = self.bounds.size.height
                self.xpos = Int((self.width-30)/2)
            }
        
            
            .onTapGesture {
                withAnimation(.spring()) {
                    if(self.state == 0){
                        self.state = 1
                        self.Radius = 0
                        self.news.display = self.news.content
                        //self.minHeight = self.height
                        self.xpos = Int(self.width/2)
                    }
                    else{
                        self.state = 0
                        self.Radius = 15
                        self.news.display = self.news.short
                        //self.minHeight = 0
                        self.xpos = Int((self.width-30)/2)
                    }
                }
        }
        
        
         
        
    }
}

struct NewsBoxIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsBoxIView(newsInit: News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "Wowjdsahfjdkslahjfkdhsafhdjkslahfjdlshajlvdblvkbeqjfkb", display: "Wow", isShort: true))
    }
}

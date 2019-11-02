//
//  MainView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/10/31.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct News: Identifiable {
    var id: String
    var title: String
    var author: String
    var short: String
    var content: String
}

func getNews() -> [News] {
    let newsDicts = [
        ["id":"0",
         "title":"我们走在大路上",
         "author":"习近平",
         "short":"为了简单起见，预定义了...",
         "content":"每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News："
        ],
        ["id":"1",
         "title":"我们走在大路上",
         "author":"习近平",
         "short":"为了简单起见，预定义了...",
         "content":"每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News："
        ]
    ]
    
    var newslist: [News] = []
    for newsDict in newsDicts {
        let news = News(id: newsDict["id"]!, title: newsDict["title"]!, author: newsDict["author"]!, short: newsDict["short"]!, content: newsDict["content"]!)
        newslist.append(news)
        
    }
    return newslist
}
struct MainView: View {
    var NewsList: [News] = getNews()

    init() {
        let aColor = UIColor(named: "customControlColor")
        UINavigationBar.appearance().backgroundColor = aColor
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                List(NewsList){
                    news in
                    
                        NewsBoxIView(newsInit: news)
                    
                }
                .listRowBackground(Color(UIColor(named: "customControlColor") ?? .white))
            }
 .navigationBarTitle(Text("Antis Connect"))
        }
            
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

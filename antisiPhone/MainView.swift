//
//  MainView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/10/31.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI
import ModalView

struct News: Identifiable {
    var id: String
    var title: String
    var author: String
    var short: String
    var content: String
    var display: String
    var isShort: Bool
}

func getNews() -> [News] {
    let newsDicts = [
        ["id":"0",
         "title":"我们走在大路上",
         "author":"习近平",
         "short":"每一条新闻资讯包含标题...",
         "content":"每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News："
        ],
        ["id":"1",
         "title":"我们走在大路上",
         "author":"习近平",
         "short":"每一条新闻资讯包含标题...",
         "content":"每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News：每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News"
        ],
        ["id":"2",
         "title":"我们走在大路上",
         "author":"习近平",
         "short":"每一条新闻资讯包含标题...",
         "content":"每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。每一条新闻资讯包含标题、作者、发布日期、详细内容、图片等信息。创建一个 swift 文件，命名为 News.swift。在该文件内创建一个新闻模型 News"
        ]
    ]
    
    var newslist: [News] = []
    for newsDict in newsDicts {
        let news = News(id: newsDict["id"]!, title: newsDict["title"]!, author: newsDict["author"]!, short: newsDict["short"]!, content: newsDict["content"]!,
                        display: newsDict["short"]!, isShort: true)
        newslist.append(news)
        
    }
    return newslist
}
struct MainView: View {
    @State private var NewsList: [News] = getNews()

    init() {
        //let aColor = UIColor(named: "customControlColor")
        //UINavigationBar.appearance().backgroundColor = aColor
         
    }
    
    var body: some View {
        NavigationView {
            ScrollView() {
                
                ForEach(NewsList){
                    news in
                    NewsBoxIView(newsInit: news)
                        
                }

                .listRowBackground(Color(UIColor(named: "customControlColor") ?? .white))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)

                }.layoutPriority(0)
                
        

                
 .navigationBarTitle(Text("Antis Connect"))
        .statusBar(hidden: true)
            }
         //.animation(.default)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

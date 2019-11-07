//
//  CashView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct cLog: Identifiable {
    var id: String
    var change: String
    var comment: String
    var time: String
}

func getcLog() -> [cLog] {
    let newsDicts = [
        ["id":"0",
         "change":"+99438",
         "comment":"现金账户充值",
         "time":"2019-09-18"
        ],
        ["id":"1",
         "change":"+2343",
         "comment":"提成",
         "time":"2019-09-18"
        ],
        ["id":"2",
         "change":"+29",
         "comment":"提成",
         "time":"2019-09-18"
        ]
    ]
    
    var newslist: [cLog] = []
    for newsDict in newsDicts {
        let news = cLog(id: newsDict["id"]!, change: newsDict["change"]!, comment: newsDict["comment"]!, time: newsDict["time"]!)
        newslist.append(news)
        
    }
    return newslist
}

struct CreditView: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.heartRate
    @State private var showingSheet = false
    @State private var LogList: [cLog] = getcLog()
    
    var body: some View {
        NavigationView{
            VStack{
                   HikeGraph(hike: hike, path: dataToShow)
                       .frame(height: 200, alignment: .center)
                    .padding(EdgeInsets(top: -20, leading: 20, bottom: 80,
                                        trailing: 20))
                
                VStack {
                                 HStack {
                                     VStack(alignment: .leading) {
                                      Text("998")
                                        .font(.largeTitle)
                                             .fontWeight(.black)
                                             .foregroundColor(.primary)
                                             .lineLimit(3)
                                      Text("积分余额")
                                      .font(.headline)
                                      .foregroundColor(.secondary)
        
                                      
                                      }
                                     Spacer()
                                    Button(action: {
                                        // What to perform
                                        self.showingSheet = true
                                    }) {
                                        // How the button looks like
                                        Text("充值")
                                            .fontWeight(.bold)
                                            .font(.headline)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(20)
                                            .foregroundColor(.white)
                                    }
                                    .sheet(isPresented: $showingSheet) {
                                        Text("🥑")
                                    }
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
                              ))
                    .padding()
                Form{
                    
                Section(header:Text("历史记录")){
                        List(LogList){
                            log in
                        VStack {
                            HStack {
                                     VStack(alignment: .leading) {
                                        Text(log.change)
                                        .font(.title)
                                             .fontWeight(.black)
                                             .foregroundColor(.primary)
                                        Text(log.comment)
                                            .font(.subheadline)
                                      .foregroundColor(.secondary)
                                    Text(log.time)
                                        .font(.subheadline)
                                    .foregroundColor(.secondary)
                                      }
                                     Spacer()
                                 }

                      }
                    
                    }
                    }
                }
            }.navigationBarTitle("积分账户")
        }.onAppear{
            
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView(hike: hikeData[0])
    }
}

//
//  CashView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct Log: Identifiable {
    var id: String
    var change: String
    var comment: String
    var time: String
}

func getLog() -> [Log] {
    let newsDicts = [
        ["id":"0",
         "change":"+65.00",
         "comment":"微信支付充值",
         "time":"2019-09-18"
        ],
        ["id":"1",
         "change":"+128.00",
         "comment":"微信支付充值",
         "time":"2019-09-18"
        ],
        ["id":"2",
         "change":"+15.00",
         "comment":"微信支付充值",
         "time":"2019-09-18"
        ]
    ]
    
    var newslist: [Log] = []
    for newsDict in newsDicts {
        let news = Log(id: newsDict["id"]!, change: newsDict["change"]!, comment: newsDict["comment"]!, time: newsDict["time"]!)
        newslist.append(news)
        
    }
    return newslist
}

struct CashView: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    @State private var showingSheet = false
    @State private var LogList: [Log] = getLog()
    
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
                                      Text("¥65.00")
                                        .font(.largeTitle)
                                             .fontWeight(.black)
                                             .foregroundColor(.primary)
                                             .lineLimit(3)
                                      Text("现金余额")
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
                                        PayView()
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
            }.navigationBarTitle("现金账户")
        }.onAppear{
            
        }
    }
}

struct CashView_Previews: PreviewProvider {
    static var previews: some View {
        CashView(hike: hikeData[0])
    }
}

//
//  MiddleView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct Logh: Identifiable {
    var id: String
    var device: String
    var reason: String
    var time: String
    var location: String
    var params: String
}

func getLogh() -> [Logh] {
    let newsDicts = [
        ["id":"0",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ],
        ["id":"1",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ],
        ["id":"2",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ],
        ["id":"3",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ],
        ["id":"4",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ],
        ["id":"5",
         "device":"ANTIS Z1",
         "reason":"刷卡了你能说啥",
         "time":"2019-09-18",
         "location":"北京天安门",
         "params":"-"
        ]
    ]
    
    var newslist: [Logh] = []
    for newsDict in newsDicts {
        let news = Logh(id: newsDict["id"]!, device: newsDict["device"]!, reason: newsDict["reason"]!, time: newsDict["time"]!, location: newsDict["location"]!, params: newsDict["params"]!)
        newslist.append(news)
        
    }
    return newslist
}

struct MiddleView: View {
    @State private var LogList: [Logh] = getLogh()
    @State var isPresented: Bool = false
    @State var cur: Logh = Logh(id: "id", device: "device", reason: "reason", time: "time", location: "location", params: "params")
    var body: some View {
        NavigationView{
            VStack{
        HikeDetail(hike: hikeData[0])
        .padding(.horizontal)
            .navigationBarTitle("历史记录")
                Form{
                Section(header:Text("历史记录")){
                                List(LogList){
                                    log in
                                    Button(action: { self.isPresented.toggle()
                                        self.cur = log
                                    }) {
                                        VStack {
                                                                        HStack {
                                                                                 VStack(alignment: .leading) {
                                                                                    Text(log.device)
                                                                                        .font(.title)
                                                                                        .fontWeight(.bold)
                                                                                         .foregroundColor(.primary)
                                        
                                                                                Text(log.time)
                                                                                    .font(.subheadline)
                                                                                .foregroundColor(.secondary)
                                                                                  }
                                                                                 Spacer()
                                                                             }

                                                                  }
                                    }.sheet(isPresented: self.$isPresented) {
                                        VStack{
                                        LandmarkDetail(landmark: UserData().landmarks[0])
                                        .environmentObject(UserData())
                                        Form {
                                            
                                            
                                            Section(header: Text("具体参数")){
                                                
                                            
                                                HStack{
                                                Text("设备      ")
                                                    Text(self.cur.device)
                                                }
                                                HStack{
                                                Text("地点      ")
                                                    Text(self.cur.location)
                                                }
                                                HStack{
                                                Text("原因      ")
                                                    Text(self.cur.reason)
                                                }
                                                HStack{
                                                Text("时间      ")
                                                    Text(self.cur.time)
                                                }
                                                HStack{
                                                Text("参数      ")
                                                    Text(self.cur.params)
                                                }
                                            }
                                            
                                        }
                                        }
                                    }
                                
                            
                            }
                            }
                        }
            }}.navigationBarTitle("积分账户")
                }
        }


struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleView()
    }
}

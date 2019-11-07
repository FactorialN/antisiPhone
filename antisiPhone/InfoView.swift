//
//  InfoView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/10/31.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI
import ModalView

struct InfoView: View {
    var body: some View {
        NavigationView {
            ModalPresenter() {
                
                Form {
                        
                    
                    LandmarkDetail(landmark: UserData().landmarks[0])
                        .environmentObject(UserData())
                    Section(header: Text("账户")) {
                        
                            ModalLink(destination: { dismiss in
                            
                                InfoDetailView();  Button(action: dismiss) {
                                    Text("完成")
                                }
                            }) {
                                Text("个人信息")
                            }
                        ModalLink(destination: CashView(hike: hikeData[0])) {
                            Text("现金账户")
                        }
                        ModalLink(destination: CreditView(hike: hikeData[0])) {
                            Text("积分账户")
                        }
                        ModalLink(destination: Text("🦘")) {
                            Text("仪器使用套餐")
                        }
                    }
                    Section(header: Text("推广")) {
                        ModalLink(destination: Text("🍎")) {
                            Text("微信公众号")
                        }
                        ModalLink(destination: Text("🥑")) {
                            Text("Twitter")
                        }
                    }
                    
                    Section(header: Text("")) {
                        ModalLink(destination: Text("MSFT")) {
                            Text("关于")
                        }
                    }
                }
            }.navigationBarTitle("我的")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

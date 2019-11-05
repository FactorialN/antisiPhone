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
                    Section(header: Text("账户")) {
                        ModalLink(destination: Text("🐢")) {
                            Text("现金账户充值")
                        }
                        ModalLink(destination: Text("🐻")) {
                            Text("积分账户充值")
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
                        ModalLink(destination: Text("🍎")) {
                            Text("关于")
                        }
                    }
                }
            }.navigationBarTitle("My")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

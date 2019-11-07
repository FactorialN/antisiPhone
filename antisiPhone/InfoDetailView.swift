//
//  InfoDetailView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct InfoDetailView: View {
    @State private var wechat : String = "woww"
    @State private var mobilephone : String = "123"
    @State private var fullname : String = "123"
    @State private var gender : String = "123"
    @State private var identity : String = "123"
    @State private var keyboardUp = false
    private var keyboardHeight: CGFloat { 150 }
    
    init() {
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
            
            Form {
                
                
                Section(header: Text("基本资料")){
                    HStack{
                    Text("微信号      ")
                    TextField("", text: $wechat)
                    }
                    HStack{
                    Text("手机号      ")
                    TextField("", text: $mobilephone)
                    }
                    HStack{
                    Text("全名          ")
                    TextField("", text: $fullname)
                    }
                    HStack{
                    Text("性别          ")
                    TextField("", text: $gender)
                    }
                    HStack{
                    Text("身份证号  ")
                    TextField("", text: $identity)
                    }
                }
                
            }
            
                
            
        }
                .navigationBarTitle("个人信息")
            .onAppear{
                self.wechat = "FactorialN"
                self.mobilephone = "18500752199"
                self.fullname = "刘光哲"
                self.gender = "M"
                self.identity = "500103199910245917"
            }
    }
}
}

struct InfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetailView()
    }
}

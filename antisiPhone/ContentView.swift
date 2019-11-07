//
//  ContentView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/10/24.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    init() {

    }
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("发现")
                }.tag(0)
            Text("")
            .tabItem {
                Image(systemName: "2.circle")
                Text("睡觉")
            }.tag(1)
            MiddleView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("记录")
                }.tag(2)
            InfoView()
            .tabItem {
                Image(systemName: "4.circle")
                Text("我的")
            }.tag(3)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

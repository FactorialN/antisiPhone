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
                    Text("First")
                }.tag(0)
            Text("History View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }.tag(1)
            InfoView()
            .tabItem {
                Image(systemName: "3.circle")
                Text("我的")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

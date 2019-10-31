//
//  MainView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/10/31.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    Text("Hello World")
                    Text("Goodbye happiness")
                }
            }
 .navigationBarTitle(Text("安提思新闻"))
            
        }.background(SwiftUI.Color.white)
        //Text( )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

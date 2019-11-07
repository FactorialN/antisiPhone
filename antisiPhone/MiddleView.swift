//
//  MiddleView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct MiddleView: View {
    var body: some View {
        NavigationView{
        HikeDetail(hike: hikeData[0])
        .padding(.horizontal)
            .navigationBarTitle("历史记录")
        }
    }
}

struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleView()
    }
}

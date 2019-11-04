//
//  AnimationView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    @State private var opacity = 1.0

    var body: some View {
        Button(action: {
            withAnimation {
                self.opacity -= 0.2
            }
        }) {
            Text("Tap here")
                .padding()
                .opacity(opacity)
        }
    }
}
struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

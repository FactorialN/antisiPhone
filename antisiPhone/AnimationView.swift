//
//  AnimationView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI
import ModalView

struct AnimationView: View {
    @State private var opacity = 1.0

    var body: some View {
        ModalPresenter {
            ModalLink(destination: NewsBoxIView(newsInit: News(id: "0", title: "Draw", author: "Paint", short: "Wow", content: "Wowjdsahfjdkslahjfkdhsafhdjkslahfjdlshajlvdblvkbeqjfkb", display: "Wow", isShort: true))) {
                Text("Hello")
            }
        }
    }
}
struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

//
//  HostingController.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/3.
//  Copyright © 2019 factorialn. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class HostingController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

/*
struct HostingController_Previews: PreviewProvider {
    static var previews: some View {
        HostingController()
    }
}
*/

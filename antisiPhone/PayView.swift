//
//  PayView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct PayView: View {
    
    @State var selectedSegment: Segment?
    
    var body: some View {
        let body = GeometryReader { geometry in
            self.createBody(size: geometry.size).edgesIgnoringSafeArea(.vertical)
        }
        
        return NavigationView {
            body
        }
    }
    
    // MARK: - Private
    
    private func createBody(size: CGSize) -> some View {
        let circleRadius = size.height / 2.0
        let buttonWidth = (size.width - 3.0 * 16.0) / 2.0
        
        return ZStack {
            Color.background
                .edgesIgnoringSafeArea(.vertical)
            VStack(alignment: .center) {
                self.createTitle()
                self.createCircleControl(radius: circleRadius)
                self.createDescription()
                self.createButtons(width: buttonWidth)
            }.padding(.top, 32.0)
        }
            }
    
    private func createTitle() -> some View {
        return Group {
            Text("金额选择")
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
            Text("选择想要充值的金额.")
                .font(.system(.headline))
                .fontWeight(.regular)
        }
    }
    
    private func createDescription() -> some View {
        return Group {
            Text(selectedSegment?.title ?? "")
                .font(.system(.headline))
                .fontWeight(.semibold)
            Group {
                Text(selectedSegment?.description ?? "")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray.opacity(0.9))
                    /*+
                Text(" Learn More...")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)*/
            }
            .multilineTextAlignment(.center)
            .lineLimit(3)
        }
    }
    
    private func createButtons(width: CGFloat) -> some View {
        return Group {
            HStack(spacing: 16.0) {
                /*Button(action: { }) {
                    Text("之后支付")
                        .font(.system(.headline))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .frame(width: width, height: 50.0)
                .background(Color.white)
                .cornerRadius(12.0)*/
                
                Button(action: { }) {
                    Text("现在支付")
                        .font(.system(.headline))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .frame(width: width, height: 50.0)
                .background(Color.black)
                .cornerRadius(12.0)
            }.padding(.top, 24.0)
            
            /*Button(action: { }) {
                Text("Show Keypad")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
            }.padding(.top, 12.0)*/
        }
    }
    
    private func createCircleControl(radius: CGFloat) -> some View {
        let totalBalance: Double = 1682.55
        let segments: [Segment] = [
            Segment(
                color: Color.red.opacity(0.8),
                amount: 175.0,
                title: "小额",
                description: "小额支付较为灵活"),
            Segment(
                color: Color.yellow.opacity(0.8),
                amount: 672.37,
                title: "中等额度",
                description: "我觉得这个额度还不错哟"),
            Segment(
                color: Color.green.opacity(0.8),
                amount: 1180.78,
                title: "大额",
                description: "是不是太多了一点啊...")
        ]
        
        let circleControl = CircleControl(totalBalance: totalBalance, segments: segments, selectedSegment: $selectedSegment)
        
        return circleControl
            .frame(width: radius, height: radius)
            .padding(16.0)
    }
}


struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}

//
//  SleepView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import SwiftUI

struct SleepView: View {
    var body: some View {
        NavigationView{
            VStack{
            AnimatableCards()
                .frame(width: 400, height: 300)
            VStack {
                                     HStack {
                                         VStack(alignment: .leading) {
                                          Text("211")
                                            .font(.largeTitle)
                                                 .fontWeight(.black)
                                                 .foregroundColor(.primary)
                                                 .lineLimit(3)
                                          Text("剩余次数")
                                          .font(.headline)
                                          .foregroundColor(.secondary)
            
                                          
                                          }
                                         Spacer()
                                        Button(action: {
                                            // What to perform
                                            
                                        }) {
                                            // How the button looks like
                                            Text("购买")
                                                .fontWeight(.bold)
                                                .font(.headline)
                                                .padding()
                                                .background(Color.blue)
                                                .cornerRadius(20)
                                                .foregroundColor(.white)
                                        }
                                        
                                     }
                                     .padding()
                          }
                .cornerRadius(CGFloat(15))
                             .background(
                              RoundedRectangle(cornerRadius: CGFloat(15))
                                  .stroke(Color(.sRGB, red: 100/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 0)
                                  .background((
                                      Color(UIColor(named: "customBackgroundColor") ?? .white))
                .cornerRadius(CGFloat(15))
                                      .shadow(radius: CGFloat(15))
                              ))
                    .padding()

            }
            .navigationBarTitle("睡觉")
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}

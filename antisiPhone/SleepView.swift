//
//  SleepView.swift
//  antisiPhone
//
//  Created by factorialn on 2019/11/7.
//  Copyright © 2019 factorialn. All rights reserved.
//

import UIKit
import SwiftUI
import CoreNFC

class CouponViewController: UITableViewController, NFCTagReaderSessionDelegate {

    // MARK: - Properties
    var readerSession: NFCTagReaderSession?
    var couponCode: String = String()
    
    // MARK: - Actions
    func createCoupon() {
        guard NFCNDEFReaderSession.readingAvailable else {
            let alertController = UIAlertController(
                title: "Scanning Not Supported",
                message: "This device doesn't support tag scanning.",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let couponString = ""
        
        couponCode = "FISH" + couponString
        
        readerSession = NFCTagReaderSession(pollingOption: .iso14443, delegate: self, queue: nil)
        readerSession?.alertMessage = "Hold your iPhone near an NFC Type 2 tag."
        readerSession?.begin()
    }
    
    // MARK: - Private helper functions
    func write(_ data: Data, to tag: NFCMiFareTag, offset: UInt8) {
        // T2T Write command to write a 4 bytes block at specific block offset
        let writeBlockCommand: UInt8 = 0xA2
        let successCode: UInt8 = 0x0A
        let blockSize = 4
        var blockData: Data = data.prefix(blockSize)
        
        // You need to zero-padded the data to the block size
        if blockData.count < blockSize {
            blockData += Data(count: blockSize - blockData.count)
        }
        
        let writeCommand = Data([writeBlockCommand, offset]) + blockData
        
        tag.sendMiFareCommand(commandPacket: writeCommand) { (response: Data, error: Error?) in
            if error != nil {
                self.readerSession?.invalidate(errorMessage: "Write tag error. Please try again.")
                return
            }
            
            if response[0] != successCode {
                self.readerSession?.invalidate(errorMessage: "Write tag error. Please try again.")
                return
            }
            
            let newSize = data.count - blockSize
            if newSize > 0 {
                self.write(data.suffix(newSize), to: tag, offset: (offset + 1))
            } else {
                self.readerSession?.invalidate()
            }
        }
    }
    
    func writeCouponCode(from tag: NFCTag) {
        guard case let .miFare(mifareTag) = tag else {
            return
        }
        
        DispatchQueue.global().async {
            
            // Block size of T2T tag is 4 bytes. Coupon code is stored starting
            // at block 04. Assume the maximum coupon code length is 16 bytes.
            // Coupon code data structure is as follow:
            // Block 04 => Header of the coupon. 2 bytes magic signature + 1 byte use counter + 1 byte length field.
            // Block 05 => Start of coupon code. Continues as indicated by the length field.
            
            let dataOffset: UInt8 = 4
            let magicSignature: [UInt8] = [0xFE, 0x01]
            let useCount: UInt8 = 0x1
            
            //let couponData = self.couponCode.data(using: .ascii)!
            
            //let data = Data(magicSignature + [useCount, UInt8(couponData.count)]) + couponData
            let couponCode = "33A7221DAB1802004644533730563031414E54495320332E302E31302020202050352020202020202020202020202020000000000000FF078069010302040506B20B00004DF4FFFFB20B000004FB04FBB20B00004DF4FFFFB20B000004FB04FBE407061E010000000000000000000000000000000000FF07806901030204050605000000FAFFFFFF0500000008F708F705000000FAFFFFFF0500000008F708F7E3070A0B131328000E26000000000000000000000000FF0780690103020405060A0000000000000000000000000000009600E80306001B003C00F000000200009600E80306001B003C00F00080020000000000000000FF0780690103020405069600E8030600190041000401000200009600E8030600190041000401800200009600E803060017004600180100020000000000000000FF0780690103020405069600E8030600170046001801800200009600E803060015004B002C01000200009600E803060015004B002C0180020000000000000000FF0780690103020405069600E8030600130050004001000200009600E80306001300500040018002000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506303130313230313931303030303534432020202020202020202020202020202020202020202020202020202020202020000000000000FF078069010302040506202020202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF07806901030204050600000000000000000000000000000000DE070501000000000000000000000000070059000C0000000000000000000000000000000000FF07806901030204050601F9FD93012BA7C1012BA7C5012BB294012BB294012BB294012BB8A70000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF078069010302040506"
            let data =  couponCode.data(using: .ascii)!

            self.write(data, to: mifareTag, offset: dataOffset)
        }
    }
    
    // MARK: - NFCTagReaderSessionDelegate
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        // If necessary, you may perform additional operations on session start.
        // At this point RF polling is enabled.
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        // If necessary, you may handle the error. Note session is no longer valid.
        // You must create a new session to restart RF polling.
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        var tag: NFCTag? = nil
        
        for nfcTag in tags {
            // In this example you are searching for a MIFARE Ultralight tag (NFC Forum T2T tag platform).
            if case let .miFare(mifareTag) = nfcTag {
                if mifareTag.mifareFamily == .ultralight {
                    tag = nfcTag
                    break
                }
            }
        }
        
        if tag == nil {
            session.invalidate(errorMessage: "No valid tag found.")
            return
        }
        
        session.connect(to: tag!) { (error: Error?) in
            if error != nil {
                session.invalidate(errorMessage: "Connection error. Please try again.")
                return
            }
            self.writeCouponCode(from: tag!)
        }
    }
}


struct SleepView: View {
    
    
    var body: some View {
        NavigationView{
            VStack{
            AnimatableCards()
                .frame(width: 400, height: 300)
            VStack {
                                     HStack {
                                         VStack(alignment: .leading) {
                                          Text("211 次")
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
            
            VStack {
                                     HStack {
                                         VStack(alignment: .leading) {
                                          Text("985 天")
                                            .font(.largeTitle)
                                                 .fontWeight(.black)
                                                 .foregroundColor(.primary)
                                                 .lineLimit(3)
                                          Text("订阅周期")
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
        .onAppear(){
            print("show")
            //var c = CouponViewController()
            //c.createCoupon()
        }
        .onDisappear(){
            
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}

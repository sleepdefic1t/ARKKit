//
//  NFC.swift
//  ARKKit
//
//  /*  based on the tutorial in the provided link */
//  /*  http://jamesonquave.com/blog/core-nfc-tutorial-for-nfc-on-ios-devices  */
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import UIKit
import CoreNFC

class NFCScanTransactionViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    var helper: NFCHelper?
    var scanButton: UIButton!
    var payloadLabel: UILabel!
    var payloadText = ""
    
    override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 230 ))
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            scanButton = UIButton(type: .system)
            scanButton.setTitle("Scan NFC", for: .normal)
            scanButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            scanButton.isEnabled = true
            scanButton.addTarget(self, action: #selector(didTapReadNFC), for: .touchUpInside)
            scanButton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 230)
        self.view.addSubview(scanButton)
            payloadLabel = UILabel(frame: scanButton.frame.offsetBy(dx: 0, dy: 40))
            payloadLabel.text = "to receive transaction request"
            payloadLabel.textAlignment = .center
            payloadLabel.numberOfLines = 100
        self.view.addSubview(payloadLabel)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) { print("session = \(session)") }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records { print(record.payload) }
        }
    }
    
    func onNFCResult(success: Bool, message: String) {
        if success { payloadText = "\(payloadText)\n\(message)" }
        else { payloadText = "\(payloadText)\n\(message)" }
        DispatchQueue.main.async { self.payloadLabel.text = self.payloadText }
    }
    
    @objc func didTapReadNFC() {
        if helper == nil {
            helper = NFCHelper()
            helper?.onNFCResult = self.onNFCResult(success:message:)
        }
        payloadText = ""
        helper?.restartSession()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

class NFCHelper: NSObject, NFCNDEFReaderSessionDelegate {
    
    var onNFCResult: ((Bool, String) -> ())?
    
    func restartSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        guard let onNFCResult = onNFCResult else { return }
        onNFCResult(false, error.localizedDescription)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        guard let onNFCResult = onNFCResult else { return }
        for message in messages {
            for record in message.records where record.payload.count > 0 {
                if let payloadString = String.init(data: record.payload, encoding: .utf8) {
                    onNFCResult(true, payloadString)
                }
            }
        }
    }
    
}



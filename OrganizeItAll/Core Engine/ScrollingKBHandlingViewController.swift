//
//  KBHandlingViewController.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/21/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit

class ScrollingKBHandlingViewController: UIViewController {

    @IBOutlet weak var kbHandlingScrollview: UIScrollView!
    
    let animDuraction = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.kbHandlingScrollview.contentSize = self.kbHandlingScrollview.bounds.size

    }

    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                kbHandlingScrollview.contentSize = CGSize(
                    width: kbHandlingScrollview.contentSize.width, height: kbHandlingScrollview.bounds.size.height + keyboardSize.height)
                
                kbHandlingScrollview.setContentOffset(CGPoint(x: 0, y:  keyboardSize.height), animated: true)
            }
        }
    }
    
}

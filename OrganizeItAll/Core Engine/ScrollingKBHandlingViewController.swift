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
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                
                self.kbHandlingScrollview.contentInset = insets
                self.kbHandlingScrollview.scrollIndicatorInsets = insets

                UIView.animate(withDuration: animDuraction){
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
}

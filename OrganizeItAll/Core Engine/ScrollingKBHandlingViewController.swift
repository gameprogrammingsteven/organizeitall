//
//  KBHandlingViewController.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/21/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//
//
//
// This and linked, especially linked question, helps for content size and why.
// https://stackoverflow.com/questions/16094096/uiscrollview-contentsize-is-reset-to-zero-when-using-auto-layout
//
// This source helps to ensure all constraints stay within subview.
// https://medium.com/allatoneplace/programmatic-uiscrollview-with-autolayout-in-ios-11-f4f50c9e9dd7


import UIKit

class ScrollingKBHandlingViewController: UIViewController {

    @IBOutlet weak var kbHandlingScrollview: UIScrollView!
    
    let animDuraction = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // If using pure autolayout, retae a subview in the xib and attach constraints, or programmatically, to the same size as the content.
        // UIScrollViews don't use layout guides to measure their size.
        // Rather, their insides "push out" is a way to think about it, combined with
        // the Stack Overflow linked.
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

//
//  CustomStackview.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/22/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//
// This will end up looking like a lot.
// But it will be worth it, because of the sheer amount of time it saves
// Removing the need to mess with options, autolayout, and what will happen
// when added to a textView that sizes itself.
// Plus, this code is meant to be written once, then used as options in Xibs after.

import UIKit

class CustomStackview: UIView {
    
    @IBInspectable var isVertical = true
    var reversed = false;
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        var lastY:CGFloat = 0;
        if (isVertical) {
            if (!reversed) {
                for i in stride(from: 0, through: self.subviews.count-1, by: 1)  {
                    let tempSubview = self.subviews[i];
                    if(tempSubview.isHidden) {
                        continue
                    }
                    tempSubview.frame = CGRect(x: tempSubview.frame.origin.x, y: lastY, width: tempSubview.bounds.size.width, height: tempSubview.bounds.size.height)
                    lastY = lastY + tempSubview.bounds.size.height;
                }
            }
            else if(reversed == true) {
                lastY = self.bounds.size.height;
                
                for i in stride(from: self.subviews.count-1, through: 0, by: -1)  {
                    let tempSubview = self.subviews[i];
                    if(tempSubview.isHidden) {
                        continue
                    }
                    lastY = lastY - tempSubview.bounds.size.height;
                    tempSubview.frame = CGRect(x: tempSubview.frame.origin.x, y: lastY, width: tempSubview.bounds.size.width, height: tempSubview.bounds.size.height)
                }
            }
        }
    }
    
    
}

//
//  MView.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/21/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//
// M = Moya. This is a superview I placed for adding universal functions.

import UIKit

class MView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        innerInit()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        innerInit()
    }
    
    func innerInit() {
        //Called by subclasses no matter what, once, on init
    }
}

//
//  heightAwareLabel.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/22/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit

class HeightAwareLabel: UILabel {

    override var text: String? {
        didSet {
            resizeHeightForText()
        }
    }
    
    // https://stackoverflow.com/questions/30450434/figure-out-size-of-uilabel-based-on-string-in-swift
    //For use in StackView using dynamic height, vertical
    //ensure numLines is unlimited, (set to 0)
    func resizeHeightForText() {
        lineBreakMode = .byWordWrapping
        sizeToFit()
        setNeedsLayout()
        setNeedsDisplay()
        superview?.setNeedsLayout()
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return boundingBox().size
    }
    
    func boundingBox() -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        return self.text?.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil) ?? .zero
    }

}

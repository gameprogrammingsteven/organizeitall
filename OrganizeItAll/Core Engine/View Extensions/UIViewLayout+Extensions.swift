//
//  UIViewLayout+Extensions.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/22/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit

private var keyLeftMargin = 0
private var keyRightMargin = 0
private var keyTopMargin = 0
private var keyBottomMargin = 0

extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: frame.origin.y, width: bounds.size.width, height: bounds.size.height)
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(x: frame.origin.x, y: newValue, width: bounds.size.width, height: bounds.size.height)
        }
    }
    
    var width: CGFloat {
        get {
            return bounds.size.width
        }
        set {
            frame = CGRect(x: frame.origin.y, y: frame.origin.y, width: newValue, height: bounds.size.height)
        }
    }
    
    var height: CGFloat {
        get {
            return bounds.size.height
        }
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: bounds.size.width, height: newValue)
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + bounds.size.width
        }
        set {
            frame = CGRect(x: newValue - bounds.size.width, y: frame.origin.y, width: bounds.size.width, height: bounds.size.height)
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + bounds.size.height
        }
        set {
            frame = CGRect(x: frame.origin.x, y: newValue - bounds.size.height, width: bounds.size.width, height: bounds.size.height)
        }
    }
    
    
    @IBInspectable var marginLeft: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyLeftMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyLeftMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBInspectable var marginRight: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyRightMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyRightMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBInspectable var marginTop: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyTopMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyTopMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBInspectable var marginBottom: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyBottomMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyBottomMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

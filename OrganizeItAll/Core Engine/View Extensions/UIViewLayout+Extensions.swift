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
    var marginLeft: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyLeftMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyLeftMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var marginRight: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyRightMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyRightMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var marginTop: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyTopMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyTopMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var marginBottom: CGFloat {
        get {
            return objc_getAssociatedObject(self, &keyBottomMargin) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &keyBottomMargin, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

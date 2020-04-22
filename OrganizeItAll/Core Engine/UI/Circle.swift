//
//  Circle.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/21/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit

class Circle: MView {
    override func innerInit() {
        let squareLength = CGFloat.maximum(self.bounds.size.width, self.bounds.size.height)
        self.bounds.size = CGSize(width: squareLength, height: squareLength)
        self.layer.cornerRadius = squareLength / 2
    }
}

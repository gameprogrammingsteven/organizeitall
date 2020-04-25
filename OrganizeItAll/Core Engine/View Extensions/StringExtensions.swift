//
//  StringExtensions.swift
//  OrganizeItAll
//
//  Created by Stephen Johnson on 4/24/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func boundsFor(maxWidth: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        return self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
    }
    
}

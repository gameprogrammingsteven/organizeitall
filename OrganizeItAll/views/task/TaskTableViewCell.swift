//
//  TaskTableViewCell.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/12/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit





class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblText: UILabel!
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //Reset data before reusing the cell
    override func prepareForReuse() {
        super.prepareForReuse()
        self.lblText.text = nil
        self.contentView.backgroundColor = nil
        self.accessoryType = .none
        self.tintColor = nil
    }
    
    //https://github.com/raghurammahathi/Tutorials/blob/79d8cf3a67f86282c381df46b62f24413b15b663/Core%20Graphics/Shapes/Shapes/ViewController.swift
    func drawCircle(){
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 5, y: 5, width: 246, height: 246)
        context?.setFillColor(UIColor.randomColor().cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(6)
        
        context?.addEllipse(in: rectangle)
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imgView.image = img

        
    }
}

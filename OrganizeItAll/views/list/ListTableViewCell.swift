//
//  ListTableViewCell.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/15/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var insideCircle: UIView!
    
    static let minimumHeight: CGFloat  = 44
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        innerTableCellInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerTableCellInit()
    }
    
    func innerTableCellInit() { //Refactor possibly into common file
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.insideCircle.backgroundColor = .randomColor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //Reset data before reusing the cell
    override func prepareForReuse() {
        super.prepareForReuse()
        self.lblName.text = nil
        self.contentView.backgroundColor = nil
        self.accessoryType = .none
        self.tintColor = nil
    }
    
    //https://github.com/raghurammahathi/Tutorials/blob/79d8cf3a67f86282c381df46b62f24413b15b663/Core%20Graphics/Shapes/Shapes/ViewController.swift
   
    
}

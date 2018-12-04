//
//  XYYCityTableViewCell.swift
//  xiaoyingying
//
//  Created by leimo on 2018/8/8.
//  Copyright © 2018年 youke. All rights reserved.
//

import UIKit
import Reusable

class XYYCityTableViewCell: UITableViewCell, Reusable{
    
    let backView = UIView()
    let cityLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        self.backView.backgroundColor = UIColor.white
        self.contentView.addSubview(self.backView)
        self.backView.frame = CGRect(x: 15, y: 0, width: screenWidth - 30, height: 45)
        
        self.cityLabel.frame = CGRect(x: 15, y: 5, width: screenWidth - 45, height: 35)
        self.cityLabel.backgroundColor = UIColor.white
        self.cityLabel.textColor = UIColor.black//hex(hexString: "#333333")
        self.cityLabel.font = UIFont.systemFont(ofSize: 15)
        self.backView.addSubview(self.cityLabel)
        
        
    }

}

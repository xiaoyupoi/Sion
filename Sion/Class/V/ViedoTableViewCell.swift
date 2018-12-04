//
//  ViedoTableViewCell.swift
//  Sion
//
//  Created by leimo on 2018/7/11.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class ViedoTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        return
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

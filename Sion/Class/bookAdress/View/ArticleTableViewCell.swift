//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Puspank Kumar on 05/01/20.
//  Copyright © 2020 Pushpank Kumar. All rights reserved.
//

import UIKit
import Reusable

class ArticleTableViewCell: UITableViewCell, Reusable {
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        creatUI()
    }
    
    func creatUI() {
        titleLabel = UILabel()
        titleLabel?.textColor = .black
        self.contentView.addSubview(titleLabel!)
        
        titleLabel?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.centerY.equalTo(self)
            make.width.equalTo(100)
        }
        
        descriptionLabel = UILabel()
        descriptionLabel?.textColor = .black
        self.contentView.addSubview(descriptionLabel!)
        
        descriptionLabel?.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(0)
            make.centerY.equalTo(self)
            make.width.equalTo(screenWidth - 120)
        }
    }

}

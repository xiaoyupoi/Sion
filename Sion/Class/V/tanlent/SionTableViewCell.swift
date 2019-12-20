//
//  SionTableViewCell.swift
//  Sion
//
//  Created by leimo on 2018/3/27.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import Reusable

class SionTableViewCell: UITableViewCell, Reusable {
  
  let nameLabel = UILabel(frame: CGRect(x: 10, y: 2, width: UIScreen.main.bounds.size.width, height: 20))
  let singerLabel = UILabel(frame: CGRect(x: 10, y: 20, width: UIScreen.main.bounds.size.width, height: 20))
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    // 设置选中cell时无高亮等效果
    self.selectionStyle = .none
    nameLabel.textColor = UIColor.magenta
    singerLabel.textColor = UIColor.red
    self.contentView.addSubview(nameLabel)
    self.contentView.addSubview(singerLabel)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

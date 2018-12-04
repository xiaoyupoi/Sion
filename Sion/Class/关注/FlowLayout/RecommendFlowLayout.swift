//
//  RecommendFlowLayout.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class RecommendFlowLayout: UICollectionViewFlowLayout {
  
  override init() {
    super.init()
    //布局方向 水平布局
    self.scrollDirection = .vertical
    //每个item大小
    self.itemSize = RecommendCell.itemSize()
    //行间距
    self.minimumLineSpacing = 0.0
    //设置分区的EdgeInset
    self.sectionInset = UIEdgeInsets.zero
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

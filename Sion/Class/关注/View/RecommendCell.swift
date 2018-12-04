//
//  RecommendCell.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import Reusable


fileprivate struct Metric {
  
  static let margin: CGFloat = 10
  static let scale: CGFloat = 1.38//18 / 13
  static let column: CGFloat = 3
}

class RecommendCell: UICollectionViewCell, Reusable {
  
  var descLab: UILabel!
  var iconBtn: UIButton!
  
  var cellModel: RecommendItemModel? {
    didSet {
      setItem()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    creatUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func iconTouchDown() {
    iconBtn.backgroundColor = UIColor.orange
  }
  
  @objc func iconTouchUpInside() {
    iconBtn.backgroundColor = UIColor.white
  }
  
  func setItem() {
    
    guard let item = self.cellModel else { return }
    iconBtn.kf.setBackgroundImage(with: URL(string: item.pic), for: .normal)
    descLab.text = item.title
  }
  
  static func itemSize() -> CGSize {
    //FlowLayout 设置
    // FLEX: 间距？
    let width = (screenWidth - Metric.margin * 4) / Metric.column //4: Metric.column - 1 + 3 ??
    let height = width * Metric.scale
    
    return CGSize(width: width, height: height)
  }
    
}

extension RecommendCell {
  
  func creatUI() {
    
    iconBtn.layer.masksToBounds = true
    iconBtn.layer.borderColor = UIColor.orange.cgColor
    iconBtn.layer.borderWidth = 0.5
    iconBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    iconBtn.addTarget(self, action: #selector(iconTouchDown), for: .touchDown)
    iconBtn.addTarget(self, action: #selector(iconTouchUpInside), for: .touchUpInside)
    
    descLab.font = UIFont.systemFont(ofSize: 14)
    descLab.numberOfLines = 0
    descLab.lineBreakMode = NSLineBreakMode.byWordWrapping
    
    self.contentView.addSubview(iconBtn)
    self.contentView.addSubview(descLab)
    
    iconBtn.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.size.equalTo(CGSize(width: 130, height: 130))
    }
    
    descLab.snp.makeConstraints { (make) in
      make.top.equalTo(iconBtn.snp.bottom)
      make.left.equalTo(0)
      make.width.equalTo(130)
      make.bottom.equalTo(0)
    }
  }
}

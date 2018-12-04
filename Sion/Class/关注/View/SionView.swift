//
//  SionView.swift
//  Sion
//
//  Created by leimo on 2018/5/17.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class SionView: UIView {
  
  // Only override draw() if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func draw(_ rect: CGRect) {
    // Drawing code
    let context = UIGraphicsGetCurrentContext()
    context?.setLineWidth(1.0)
    context?.setStrokeColor(UIColor(hexString: "#bdacfe").cgColor)
    //缩放系数 x*系数，y*系数 ，width，height
    context?.scaleBy(x: 0.5, y: 0.5)
    //旋转: 旋转整个View而不是只旋转画上去的部分
    context?.rotate(by: CGFloat.pi/4)
    //向右下平移
    context?.translateBy(x: 500, y: -500)
    let rectangle = CGRect.init(x: 200, y: 400, width: screenWidth - 200, height: screenWidth - 200)
    context?.addRect(rectangle)
    context?.strokePath()
    
    
  }
  
  
}

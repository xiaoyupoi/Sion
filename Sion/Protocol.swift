//
//  Protocol.swift
//  Sion
//
//  Created by leimo on 2018/3/30.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


enum Result {
  case ok(message : String)
  case empty
  case faild(message : String)
}

extension Result {
  var isValid: Bool {
    switch self {
    case .ok:
      return true
    default:
      return false
    }
  }
}
// text
extension Result {
  var textColor: UIColor {
    switch self {
    case .ok:
      return UIColor(red: 138.0 / 255.0, green: 221.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    case .empty:
      return UIColor.black
    case .faild:
      return UIColor.red
    }
  }
}

extension Result {
  var description: String {
    switch self {
    case let .ok(message):
      return message
    case .empty:
      return ""
    case let .faild(message):
      return message
    }
  }
}


extension Reactive where Base: UILabel {
  
  var validationResult: Binder<Result> {
    return Binder.init(base, binding: { (label, result) in
      label.textColor = result.textColor
      label.text = result.description
    })
  }
}

extension Reactive where Base: UITextField {
  
  var inputEnable: Binder<Result> {
    return Binder.init(base, binding: { (textFiled, result) in
      textFiled.isEnabled = result.isValid
    })
  }
}

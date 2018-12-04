//
//  ViewModelType.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

protocol ViewModelType {
  
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}

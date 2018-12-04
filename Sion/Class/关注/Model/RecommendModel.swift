//
//  RecommendModel.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
import HandyJSON

class RecommendModel: HandyJSON {
  
  var ret = 0
  var maxPageId = 5
  var totalCount = 100
  var msg = "成功"
  
  var focusList: [FocusModel]?
  var squareList: [SquareModel]?
  var categoryList: [CategoryModel]?
  var nextCategoryList: [RecommendItemModel]?
  
  required init() {}
  
  func mapping(mapper: HelpingMapper) {
    mapper <<<
      self.focusList <-- "focusList"
  }
}

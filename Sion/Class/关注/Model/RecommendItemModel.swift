//
//  RecommendItemModel.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
import HandyJSON

class RecommendItemModel: HandyJSON {
  var albumId = 0
  var categoryId = 0
  var commentScore = 0
  var commentsCount = 0
  var discountedPrice = 0
  
  var displayDiscountedPrice = ""
  var displayPrice = ""
  var materialType = ""
  var pic = ""
  var playsCount = 0
  
  var price = 0
  var priceTypeEnum = 0
  var priceUnit = ""
  var recSrc = ""
  var recTrack = ""
  
  var subtitle = ""
  var title = ""
  var tracksCount = 0
  var isFinished = 0
  var coverPath = ""
  
  var footnote = ""
  var coverLarge = ""
  var name = ""
  var nickname = ""
  var intro = ""
  
  var tracks = 0
  var playsCounts = 0
  var coverMiddle = ""
  var tags = ""
  var trackId = 0
  
  var trackTitle = ""
  var displayVipPrice = ""
  
  
  required init() {
    
  }
  /*
  func mapping(mapper: HelpingMapper) {
    mapper <<<
      self.albumId <-- "JsonKey"
    
  }
  */
}

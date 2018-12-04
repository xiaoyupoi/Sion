//
//  RecommendViewModel.swift
//  Sion
//
//  Created by leimo on 2018/5/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx
import SwiftyJSON
import RxDataSources
import HandyJSON
import Alamofire

class RecommendViewModel: NSObject {
  
  private let vmDatas = Variable<[([FocusModel]?, [SquareModel]?, [CategoryModel]?, [RecommendItemModel]?, [RecommendItemModel] )]>([])
  private var page: Int = 1
}

extension RecommendViewModel: ViewModelType {
  
  typealias Input = RecommendInput
  typealias Output = RecommendOutput
  
  struct RecommendInput {
    
  }
  
  struct RecommendOutput {
    
    let sections: Driver<[RecommendSection]>
    let requestCommend = PublishSubject<Bool>()

    init(sections: Driver<[RecommendSection]>) {
      self.sections = sections
    }
  }
  
  func transform(input: RecommendViewModel.RecommendInput) -> RecommendViewModel.RecommendOutput {
    
    let temp_sections = vmDatas.asObservable().map({ (sections) -> [RecommendSection] in
      return sections.map({ (focusList, squareList, category, nextCategoryList, models) -> RecommendSection in
         return RecommendSection(focusList: focusList, squareList: squareList, category: category, nextCategoryList: nextCategoryList, items: models)
      })
    }).asDriver(onErrorJustReturn: [])
    
    let output = RecommendOutput(sections: temp_sections)
    
    
    
    return output
  }
  
}

struct RecommendSection {
  
  var focusList: [FocusModel]?
  var squareList: [SquareModel]?
  var category: [CategoryModel]?
  
  var nextCategoryList: [RecommendItemModel]?
  
  var items: [Item]
}

extension RecommendSection: SectionModelType {
  typealias Item = RecommendItemModel
  
  init(original: RecommendSection, items: [RecommendItemModel]) {
    self = original
    self.items = items
  }
}



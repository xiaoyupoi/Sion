//
//  ArticleModel.swift
//  Sion
//
//  Created by leimo on 2020/1/7.
//  Copyright © 2020 leimo. All rights reserved.
//

import Foundation
import HandyJSON

struct ArticleList: HandyJSON {
    var articles: [Article]?
}

struct Article: HandyJSON {
    var title: String?
    var description: String?
}

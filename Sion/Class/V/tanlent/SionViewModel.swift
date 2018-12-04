//
//  SionViewModel.swift
//  Sion
//
//  Created by leimo on 2018/6/6.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import SwiftyJSON
import RxDataSources
import HandyJSON

//4f902b74f338cdd2c9259f18bcced7d958a025f113c313b7ffd0ff00ec4a77d8646b396cf5318a4b

class SionViewModel: NSObject {

  let vmDatas = Variable<[([TalentModel])]>([])
}

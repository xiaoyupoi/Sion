//
//  RegisterViewModel.swift
//  Sion
//
//  Created by leimo on 2018/4/9.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
/*
class RegiseterViewModel {
  
  let username = Variable<String>("")
  let password = Variable<String>("")
  let registerTaps = PublishSubject<Void>()
  
  let registerResult:Observable<Result>
  
  init() {
//    registerResult = registerTaps.asObservable().withLatestFrom(usernameAndPwd).flatMapLatest { (username, password) in
//      return service.register(username, password: password).observeOn(MainScheduler.instance).catchErrorJustReturn(Result.failed(message: "注册失败"))
//      }.share(replay: 1)
  }
}

enum Result {
  case ok(message:String)
  case empty
  case failed(message:String)
}

extension Result {
  var description: String {
    switch self {
    case let .ok(message):
      return message
    case .empty:
      return ""
    case let .failed(message):
      return message
    }
  }
}
*/

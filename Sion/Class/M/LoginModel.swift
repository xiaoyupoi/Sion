//
//  LoginModel.swift
//  Sion
//
//  Created by leimo on 2018/3/29.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation

struct LoginModel {
  let userName: String
  let passWord: String
  let smsCode: String
  
  init(userName: String, passWord: String, smsCode: String) {
    self.userName = userName
    self.passWord = passWord
    self.smsCode = smsCode
  }
  
}

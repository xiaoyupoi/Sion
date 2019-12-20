//
//  Const.swift
//  Sion
//
//  Created by leimo on 2018/3/27.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

let BASE_URL = "http://47.99.139.155:11000/"//"http://wx.ppiaoapp.com:18080/chuzhao/"
/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height
/// 是否IphonX
let is_IphoneX: Bool = screenHeight == 812 ? true : false
/// navbar高度
let safeAreaTopBar = is_IphoneX ? 88 : 64
/// bottom高度
let safeAreaBottomBar = is_IphoneX ? 39 : 0
/// NsuserDefaults
let defaultStand = UserDefaults.standard
/// Token
let TOKEN = defaultStand.string(forKey: "token")
/// 密码格式
let SECRET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

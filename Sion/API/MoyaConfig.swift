//
//  MoyaConfig.swift
//  monitor
//
//  Created by shutup on 2019/4/22.
//  Copyright © 2019 weijian. All rights reserved.
//

import UIKit

/// 定义基础域名 "http://apptest.ejiameng.cn/"

#if DEBUG
let MBASE_URL = "https://newsapi.org/"
#else
let MBASE_URL = "https://app.jianjianapp.cn/api/"
#endif

/// 定义返回的JSON数据字段
let RESULT_CODE = "code"  //状态码

let RESULT_MESSAGE = "msg"  //错误消息提示

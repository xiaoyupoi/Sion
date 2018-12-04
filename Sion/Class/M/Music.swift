//
//  Music.swift
//  Sion
//
//  Created by leimo on 2018/3/28.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
//歌曲结构体
class Music: NSObject {
  let name: String //歌名
  let singer: String //歌手
  
  init(name: String, singer: String) {
    self.name = name
    self.singer = singer
  }
}
////实现 CustomStringConvertible 协议，方便输出调试
//extension Music: CustomStringConvertible {
//  var description: String {
//    return "歌名: \(name) 歌手: \(singer)"
//  }
//}

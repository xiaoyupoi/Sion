//
//  MusicListViewModel.swift
//  Sion
//
//  Created by leimo on 2018/3/28.
//  Copyright © 2018年 leimo. All rights reserved.
//

import Foundation
import RxSwift

//生成tableView歌曲列表数据源
struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "届不到", singer: "雪莱"),
        Music(name: "深爱", singer: "水树奈奈"),
        Music(name: "绿光", singer: "孙燕姿"),
        Music(name: "化身孤岛的鲸", singer: "司夏_西国海妖"),
        Music(name: "化鹤归", singer: "司夏_西国海妖"),
        Music(name: "流云辞", singer: "司夏_西国海妖"),
        ])
}

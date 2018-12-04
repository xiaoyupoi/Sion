//
//  NetWorkTool.swift
//  Sion
//
//  Created by leimo on 2018/3/27.
//  Copyright © 2018年 leimo. All rights reserved.
//
import Foundation
import Moya

//新建一个枚举 遵循 TargetType协议, 枚举的case值, 为每一个接口
enum AppService {
    case resgiter(phone: String, pwd: String, userType: String, phoneCode: String)
    case login(phone: String, pwd: String, type: String, mobiletype: String)
}
//在枚举的扩展中定义网络请求必要参数
extension AppService: TargetType {

    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .resgiter(phone: _, pwd: _, userType: _, phoneCode: _):
            return "user/signup"
        case .login(phone: _, pwd: _, type: _, mobiletype: _):
            return "user/loginPhone"
        }
    }
    
    var method: Moya.Method {
        switch self {
            //    case .resgiter:
        //      return .post
        case .login, .resgiter:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case let .resgiter(phone, pwd, userType, phoneCode):
            return .requestParameters(parameters: ["phone": phone, "pwd": pwd, "userType": userType, "phoneCode": phoneCode], encoding: URLEncoding.default)
        case let .login(phone, pwd, type, mobiletype):
            return .requestParameters(parameters: ["phone" : phone, "pwd": pwd, "type": type, "mobiletype": mobiletype], encoding: URLEncoding.default)
            //    default:
            //      return .requestPlain
        }
    }
 
    var headers: [String : String]? {
        if let stringCount = TOKEN?.count, stringCount > 0 {
            return ["x-header-chuzhao-token": TOKEN!]
        }
        return nil
    }
}

let sionProvider = MoyaProvider<AppService>()//RxMoyaProvider<AppService>.init()


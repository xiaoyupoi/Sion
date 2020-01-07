//
//  API.swift
//  monitor
//
//  Created by shutup on 2019/4/22.
//  Copyright © 2019 weijian. All rights reserved.
//
/*
NetWorkRequest(.User_Get_Person, hasLoading: false, completion: { (response) -> (Void) in
    do {
        let jsonData: [String: Any] = try response.mapJSON() as! [String : Any]
        guard let code = jsonData["code"] as? Int else { return }
        if code == 12000 {
            guard let dic = jsonData["data"] as? [String:Any] else { return }
            let model = UserModel.deserialize(from: dic)
            self.userInfo = model
            self.tabView.reloadData()
        }else{
            
        }
    } catch{
    }
}) { (error) -> (Void) in
    
}
*/
import UIKit
import Moya

enum API {
    ///查询个人信息设置
    case User_Get_Person
    ///-----------
    case getArticles(country: String, apiKey: String)
}


extension API: TargetType {
    ///if token
    private struct YBApiToken {
        static var token = ""
    }
    
    var baseURL: URL {
        return URL(string: MBASE_URL)!
    }
    var path: String {
        switch self {
        case .User_Get_Person:
            return "user/get_person"
        case .getArticles:
            return "v2/top-headlines"
            
        }}

        var method: Moya.Method {
            switch self {
            case  .User_Get_Person, .getArticles:
                return .get
                /*
            case .Save_Sign_Info_Again, .Save_Assignment_Staff, .Assignment_Record_Feedback, .Task_Submit, .Save_Sign_Info, .Save_image_Url:
                return .put
                */
            default:
                return .post
            }
        }
        var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
        var task: Task {
            var parmeters: [String : Any] = [:]
            switch self {
//            case .User_Get_Person: //break 没参数不用写
            case .getArticles(let country, let apiKey):
                parmeters["country"] = country
                parmeters["apiKey"] = apiKey
           
            default:
                break
            }
            if self.path == "group_member/save_group_members" {
                return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
            }
            if method == .post || method == .put{
                let parms = try! JSONSerialization.data(withJSONObject: parmeters, options: .prettyPrinted)
                return .requestData(parms)
            }
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        }
        var headers: [String : String]? {
            var heards: [String: String]? = [:]
            let version: String?  = nil
            let stringCount = UserDefaults.standard.object(forKey: "token") as? String
            if stringCount != ""  && stringCount != nil {
                heards?["token"] = stringCount
            }
            if method == .post && self.path != "group/remove_relation" && self.path != "group_member/save_group_members" && self.path != "assignment/update_choose_state" && self.path != "assignment/update_assign_member_state" {
                heards?["Content-Type"] = "application/json"
            }
            if method == .put {
                heards?["Content-Type"] = "application/json"
            }
            
            heards?["VERSION"] = version
            return heards
//            return nil //如果有请求头写自己的
        }
        
        
}

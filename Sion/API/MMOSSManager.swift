//
//  BQSOSSManager.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/5/2.
//  Copyright © 2018年 wangli. All rights reserved.
//
/*
import UIKit
import Alamofire
import AliyunOSSiOS
class MMOSSManager: NSObject {
    func getOssToken(ossToken: @escaping(_ ossDic: Dictionary<String, Any>) -> Void, failure: @escaping(_ error: Error) -> Void) -> Void {
        let oldTime = UserDefaults.standard.object(forKey: "OSS时间戳") as? String
        let nowTime = currentTimeStamp()
        if oldTime != nil {
            if Int(nowTime)! - Int(oldTime!)! < 600 {
                if let dict = UserDefaults.standard.object(forKey: "OSS令牌") as? [String : Any], !dict.isEmpty {
                    if let _ = dict["endpoint"], let _ = dict["folder"] {
                        
                        let ossDic = dict
                        ossToken(ossDic)
                        return
                    }
                }
            }
        }
        Alamofire.request("\(MBASE_URL)image_upload/get_oss_perssion").responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value {
                    let jsonData = json as! [String : Any]
                    guard let code = jsonData["code"] as? Int else { return }
                    guard let dict = jsonData["data"] as? [String : Any] else { return }
                    if code == 12000 {
                        UserDefaults.standard.setValue(dict, forKey: "OSS令牌")
                        UserDefaults.standard.setValue(currentTimeStamp(), forKey: "OSS时间戳")
                        ossToken(dict)
                    }}
            case .failure(let error):
                failure(error as NSError)
            }
        }
//        ApiProvider.request(YBApi.getOssToken) { (result) in
//            switch result {
//            case let .success(response):
//                do {
//                    let jsonData: [String: Any] = try response.mapJSON() as! [String : Any]
//                    guard let code = jsonData["code"] as? Int else { return }
//                    guard let dict = jsonData["data"] as? [String : Any] else { return }
//                    if code == 12000 {
//                        UserDefaults.standard.setValue(dict, forKey: "OSS令牌")
//                        UserDefaults.standard.setValue(currentTimeStamp(), forKey: "OSS时间戳")
//                        ossToken(dict)
//                    }
//                } catch {}
//            case let .failure(error):
//                failure(error as NSError)
//            }
        
        
        
        
        }
        
        
//        BQSHTTPManager.shared.getRequestWithURL(path: urlString, parameter: ["": ""], success: { (jsonString) in
//            print(jsonString)
//            let returnDic = jsonString
//            let code = returnDic["code"] as! Int
//            if code == 12000 {
//                let ossDic = returnDic["result"]
//                UserDefaults.standard.setValue(ossDic, forKey: "OSS令牌")
//                UserDefaults.standard.setValue(self.getTimestamp(), forKey: "OSS时间戳")
//                ossToken(ossDic as! Dictionary<String, Any>)
//            }
//
//        }) { (error) in
//            failure(error)
//        }
//    }
    
    func ossWithOssDictionary(ossDic: [String: Any], imageData: Data, floderType:String, ossData:@escaping(_ ossURL: String, _ error: Error) -> Void) -> Void {
        //参数
        //        let key = "biaoqing"
        //        let endpoint = ossDic["endpoint"]
        //        let bucketName = ossDic["buckName"]
        //        let folder = ossDic["folder"]
        //        let domain = ossDic["accessUrl"]
        //
        //        var ossDictionary = ossDic["oss"] as! Dictionary<String, Any>
        //        let accessKey = ossDictionary["accessKeyId"]
        //        let secretKey = ossDictionary["accessKeySecret"]
        //        let securityToken = ossDictionary["securityToken"]
        //        let expiration = ossDictionary["expiration"]
        //
        //        let deAccessKey = BQDESECB.decryptUseDES(accessKey as! String, key: key)
        //        let deSecretKey = BQDESECB.decryptUseDES(secretKey as! String, key: key)
        //        let deSecurityToken = BQDESECB.decryptUseDES(securityToken as! String, key: key)
        //        let deExpiration = BQDESECB.decryptUseDES(expiration as! String, key: key)
        //
        //        if ZYCheckTool.isBlankString(deAccessKey) || ZYCheckTool.isBlankString(deSecretKey) || ZYCheckTool.isBlankString(deSecurityToken) || ZYCheckTool .isBlankString(deExpiration) {
        //            print("上传失败")
        //            return
        //        }
        
        //        let credential = 
        
    }
    
    /**
     JSONString转换字典
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData = try! JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }

    
}
*/

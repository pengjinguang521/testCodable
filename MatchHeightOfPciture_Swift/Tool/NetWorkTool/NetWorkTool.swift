//
//  NetWorkTool.swift
//  MatchHeightOfPciture_Swift
//
//  Created by JGPeng on 2018/11/19.
//  Copyright © 2018年 彭金光. All rights reserved.
//

import UIKit
import Alamofire

class NetWorkTool: NSObject {
    

    
}

// MARK: - swift 中的post 与 get 请求
extension NetWorkTool {
    
    typealias RequestSuccessBlock = (_ json:Data?)->()
    typealias RequestFailBlock = (_ error:Error?)->()
    
    
    /// GET 请求
    public static func Get(url:String, parameters:Parameters?, success:RequestSuccessBlock?, fail:RequestFailBlock?){
        
        NetWorkTool.Request(url: url, method: HTTPMethod.get, parameters: parameters, success: success, fail: fail)
    }
    /// POST 请求
    public static func Post(url:String, parameters:Parameters?, success:RequestSuccessBlock?, fail:RequestFailBlock?){
        NetWorkTool.Request(url: url, method: HTTPMethod.post, parameters: parameters, success: success, fail: fail)
    }

    private class func Request(url:String, method:HTTPMethod, parameters:Parameters?, success:RequestSuccessBlock?, fail:RequestFailBlock?){
        
        Alamofire.request(url, method:method, parameters: parameters, encoding: URLEncoding.default, headers: ["Content-Type": "application/json"]).responseJSON { (response) in
            switch response.result{
            //网络请求 成功
            case .success:do {
                
                if let successBlock = success{
                    guard  let jsonDic = response.value as? [String: Any] else {
                         print("数据返回有误")
                        return
                    }
                    let data = try! JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
                    successBlock(data)
                }
            }
                break
            //网络请求 失败
            case .failure:do {
                if let failBlock = fail{
                    failBlock(response.error)
                }
            }
                break
            }
        }
    }
}

// MARK: - 文件上传
extension NetWorkTool {
    
}
// MARK: - 文件下载
extension NetWorkTool {
    
}

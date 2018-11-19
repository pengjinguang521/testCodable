//
//  JGWallModel.swift
//  MatchHeightOfPciture_Swift
//
//  Created by JGPeng on 2018/11/19.
//  Copyright © 2018年 彭金光. All rights reserved.
//

import UIKit

class JGWallModel: Codable {
    
    var data: JGWallModelData?
    
    var code: Int = 0
    
    
    /// 声明回调block
    typealias JGWallModelReturnBlock = (_ model:JGWallModel?,_ error:Error?)->()
    
    class func JGWallModelRequestData(parameters:Dictionary<String, Any> ,returnBlock:JGWallModelReturnBlock?)  {
        
        NetWorkTool.Get(url:JGLoginUrl, parameters: parameters, success: { (json) in
            let stu = try! JSONDecoder().decode(JGWallModel.self, from: json!)
            if let returnBlock = returnBlock{
                returnBlock(stu as JGWallModel, nil)
            }
        }) { (error) in
            if let returnBlock = returnBlock{
                returnBlock(nil, error)
            }
        }
    }
}

class  JGWallModelData: Codable{

    /// 手机号码
    let user_phonenumber :String
    
    /// 用户key
    let user_key :String
    
    /// 用户token
    let user_token:String
    
    /// 用户id
    let user_id:String

}


    

    

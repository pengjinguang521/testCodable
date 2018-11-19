//
//  ViewController.swift
//  MatchHeightOfPciture_Swift
//
//  Created by JGPeng on 2018/11/19.
//  Copyright © 2018年 彭金光. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model:JGWallModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JGWallModel.JGWallModelRequestData(parameters: ["user_phoneNumber":"15890268278","user_password":"111111"]) { [weak self](model, error) in
            self?.model = model
            if model?.code == 0 {
                print(model!.data!.user_phonenumber)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}


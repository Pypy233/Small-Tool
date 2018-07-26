//
//  ViewController.swift
//  PFReminder
//
//  Created by py on 2018/7/26.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LocalNotifManager().setLocalNotification(with: "19:04", times: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


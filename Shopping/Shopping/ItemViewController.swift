//
//  ItemViewController.swift
//  Shopping
//
//  Created by py on 2018/7/25.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController{
    
    // Get the message from view controller
    var itemName: String?
    var brandName: String?
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        if itemName != nil{
            itemNameLabel.text = itemName
        }
        
        if brandName != nil{
            brandNameLabel.text = brandName
        }
    }
    
    
    @IBAction func isBuy() {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

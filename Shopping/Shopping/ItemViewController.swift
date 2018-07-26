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
    var item: Item?
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        if item != nil{
            itemNameLabel.text = itemName
            brandNameLabel.text = brandName
        }
    }
    
    
    @IBAction func isBuy(sender: UIButton) {
        if item != nil{
            if item?.isBuy == false{
                item?.isBuy = true
                itemNameLabel.textColor = UIColor.green
            }else{
                item?.isBuy = false
                itemNameLabel.textColor = UIColor.red
            }
            print(item?.description())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

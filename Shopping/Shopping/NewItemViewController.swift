//
//  NewItemViewController.swift
//  Shopping
//
//  Created by py on 2018/7/25.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController{
    
    @IBOutlet weak var itemNameTextField: UITextField!
    
    @IBOutlet weak var brandNameTextField: UITextField!
    
    
   
    @IBAction func saveItem(sender: UIButton) {
        if itemNameTextField != nil && brandNameTextField != nil{
            let item = Item(itemName: itemNameTextField.text!, brandName: brandNameTextField.text!)
        }
        dismiss(animated: true, completion: nil)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

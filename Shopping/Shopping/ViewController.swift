//
//  ViewController.swift
//  Shopping
//
//  Created by py on 2018/7/25.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    var toBuyItems = [Item(itemName: "milk", brandName: "Anchor"), Item(itemName: "bread", brandName: "US"), Item(itemName: "cellphone", brandName: "China"), Item(itemName: "shampoo", brandName: "gf"), Item(itemName: "gakki", brandName: "Japan"), Item(itemName: "py", brandName: "China")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toBuyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let item = toBuyItems[indexPath.row]
        cell.textLabel?.text = item.itemName
        if item.isBuy{
            cell.textLabel?.textColor = UIColor.green
        }else{
            cell.textLabel?.textColor = UIColor.red
        }
        
        cell.detailTextLabel?.text = item.brandName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "itemSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemSegue" {
            var destination1: ItemViewController = segue.destination as! ItemViewController
            if sender is Int {
                let item = toBuyItems[sender as! Int]
                destination1.item = item
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(<#T##animated: Bool##Bool#>)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


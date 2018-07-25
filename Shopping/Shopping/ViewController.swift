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
    
    
    let toBuyItems = [("milk", "Anchor"), ("bread", "US"), ("cellphone", "China"), ("shampoo", "gf"), ("gakki", "Japan"), ("py", "China")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toBuyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let (item, source) = toBuyItems[indexPath.row]
        cell.textLabel?.text = item
        cell.detailTextLabel?.text = source
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "itemSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemSegue" {
            var destination: ItemViewController = segue.destinationViewController as ItemViewController
            if sender is Int {
                var (itemName, brandName) = toBuyItems[sender as Int]
                destination.itemName = itemName
                destination.brandName = brandName
            }
        }
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


//
//  ViewController.swift
//  IMDb
//
//  Created by py on 2018/7/26.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var posterImageView: UIView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var releasedLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var plotLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.searchImdb(forContent: <#T##String#>)
       
    }
    
    func searchImdb(forContent: String){
        let spaceLessString = forContent.addingPercentEncoding(withAllowedCharacters:)
       // print(spaceLessString)
        let urlPath = NSURL(string: "www.omdapi.com/?t=\(spaceLessString)")
        var session = URLSession.shared
        var task = session.dataTask(with: urlPath!){
        data, responese, error -> Void in
        
            if error != nil{
                print("error!")
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


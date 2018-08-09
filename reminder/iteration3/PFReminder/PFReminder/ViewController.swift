//
//  ViewController.swift
//  PFReminder
//
//  Created by py on 2018/7/26.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let db = DataBase.shared
    var ids: [String] = []
    var notifications: [NSManagedObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // DateUtil().getCurentDate()
        LocalNotifManager().setLocalNotification(aimDate: "2018-07-27", with: "23:08", times: 10, title: "test", body: "test test test")
        //print("删除阶段")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectAll() -> [Notification]? {
        let managedObjectContext = db.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notification")
       
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest) as? [Notification]
            return fetchedResults
        } catch {
            fatalError("获取失败")
        }
    }
    
    func saveNotification(title: String, body: String) {
        let date = DateUtil().getCurentDate()
        let managedObjectContext = db.persistentContainer.viewContext
       
        let entity = NSEntityDescription.entity(forEntityName: "Notification", in: managedObjectContext)
        let notification = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
        notification.setValue(date, forKey: "id")
        notification.setValue(title, forKey: "title")
        notification.setValue(body, forKey: "body")
        
        do {
            try managedObjectContext.save()
        } catch  {
            fatalError("无法保存")
        }
        
        notifications.append(notification)
    }
    
    /*
    删除
     */
    func deleteName(title: String, body: String) {
        //步骤一：获取总代理和托管对象总管
        let managedObjectContext = db.persistentContainer.viewContext
        //步骤二：建立一个获取的请求
        let fetchRequest = NSFetchRequest<Notification>(entityName: "Notification")
        //步骤三：执行请求
        
        do {
            let fetchedObjects = try managedObjectContext.fetch(fetchRequest)
            //遍历查询的结果
            for notif in fetchedObjects{
                if notif.body == body && notif.title == title{
                    managedObjectContext.delete(notif)
                    print("删除成功")
                }
            }
            try! managedObjectContext.save()
            
        }
        catch {
            fatalError("删除失败：\(error)")
        }

    }
    
}





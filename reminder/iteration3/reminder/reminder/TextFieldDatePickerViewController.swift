//
//  TextFieldDatePickerViewController.swift
//  PFReminder
//
//  Created by py on 2018/7/27.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import UIKit

class TextFieldDatePickerViewController: UIViewController {
    /// 输入框
    var textField = UITextField()
    var dateLabel = UILabel()
    /// 日期选择器
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 选择框样式
        textField.frame = CGRect(x: self.view.frame.origin.x + 50, y: self.view.frame.origin.y + 100, width: self.view.frame.width * 2 / 3, height: 40)
        textField.layer.cornerRadius = 5.0
        textField.layer.borderWidth = 0.7
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.textAlignment = .center
        textField.placeholder = "这是一个UITextField"
        
        // MARK: - 日期选择器属性及样式
        datePicker.locale = NSLocale(localeIdentifier: "zh_cn") as Locale
        datePicker.timeZone = NSTimeZone.system
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker.addTarget(self, action: #selector(getDate), for: UIControlEvents.valueChanged)
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        datePicker.layer.masksToBounds = true
        
        // MARK: - 重点的一句
        textField.inputView = datePicker
        
        self.view.addSubview(textField)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 日期选择器选择处理方法
    func getDate(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        let date = datePicker.date
        formatter.dateFormat = "MM月dd日 HH:mm"
        let dateStr = formatter.string(from: date)
        self.textField.text = dateStr
    }
    
}

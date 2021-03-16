//
//  government.swift
//  Government
//
//  Created by Оля Качинская on 14.03.2021.
//

import UIKit

let GovernmentTaxLevelISDidChangeNotification = Notification.Name(rawValue: "GovernmentTaxLevelISDidChangeNotification")
let GovernmentSalaryISDidChangeNotification = Notification.Name(rawValue: "GovernmentSalaryISDidChangeNotification")
let GovernmentPensionISDidChangeNotification = Notification.Name(rawValue: "GovernmentPensionISDidChangeNotification")
let GovernmentAvetagePriceSDidChangeNotification = Notification.Name(rawValue: "GovernmentAvetagePriceSDidChangeNotification")

let GovernmentTaxLevelUserInfoKey = "GovernmentTaxLevelUserInfoKey"
let GovernmentSelaryUserInfoKey = "GovernmentSelaryUserInfoKey"
let GovernmentPensionUserInfoKey = "GovernmentPensionUserInfoKey"
let GovernmentAvetageUserInfoKey = "GovernmentPensionUserInfoKey"

class Government: NSObject {
    
    
    var taxLevel: Float
    {
        didSet
        {
            let dictionary = [GovernmentTaxLevelUserInfoKey: taxLevel]
            
            NotificationCenter.default.post(name: GovernmentTaxLevelISDidChangeNotification,
                                            object: self,
                                            userInfo: dictionary)
        }
    }
    
    var selary: Float{
        didSet
        {
            let dictionary = [GovernmentSelaryUserInfoKey: selary]
            NotificationCenter.default.post(name:GovernmentSalaryISDidChangeNotification,
                                            object: self,
                                            userInfo: dictionary)
        }
    }
    
  
    var pension: Float{
       didSet
       {
        let dictionary = [GovernmentPensionUserInfoKey: pension]
        NotificationCenter.default.post(name:GovernmentPensionISDidChangeNotification,
                                        object: self,
                                        userInfo: dictionary)
       }
    }
    
    var avetagePrice: Float{
        didSet
        {
            let dictionary = [GovernmentAvetageUserInfoKey: avetagePrice]
            NotificationCenter.default.post(name:GovernmentAvetagePriceSDidChangeNotification,
                                            object: self,
                                            userInfo: dictionary)
        }
    }
    
    override init() {
        self.taxLevel = 5.0
        self.selary = 1000.0
        self.pension = 500.0
        self.avetagePrice = 10.0
    }
    
    //отписка от нотификаций
    func dealoc(){
        NotificationCenter.default.removeObserver(self)
    }
}


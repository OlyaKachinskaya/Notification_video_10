//
//  AppDelegate.swift
//  Government
//
//  Created by Оля Качинская on 13.03.2021.
//
import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let government = Government()
    var businessman : Businessman
    var doctor : Doctor
    var pensioner : Pensioner
    let myAppDelegat = MyAppDelegate()
    
    override init()
    {
        businessman = Businessman(taxLevel: government.taxLevel, avetagePrice: government.avetagePrice)
        doctor = Doctor(selary: government.selary, avetagePrice: government.avetagePrice)
        pensioner = Pensioner(pension: government.pension, avetagePrice: government.avetagePrice)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        myAppDelegat.AddAllObservers()
        
        //подписка на нотификации
        let ns = NotificationCenter.default
        ns.addObserver(doctor, selector: #selector(doctor.selaryNotification), name: GovernmentSalaryISDidChangeNotification, object: nil)

        ns.addObserver(doctor, selector: #selector(doctor.averagePriceNotification), name: GovernmentAvetagePriceSDidChangeNotification, object: nil)

        ns.addObserver(pensioner, selector: #selector(pensioner.pentionNotification), name: GovernmentPensionISDidChangeNotification, object: nil)

        ns.addObserver(pensioner, selector: #selector(pensioner.averagePriceNotification), name: GovernmentAvetagePriceSDidChangeNotification, object: nil)

        
        ns.addObserver(businessman, selector: #selector(businessman.taxLevelNotification), name: GovernmentTaxLevelISDidChangeNotification, object: nil)

        ns.addObserver(businessman, selector: #selector(businessman.averagePriceNotification(note:)), name: GovernmentAvetagePriceSDidChangeNotification, object: nil)
        
       //мастер
        addObserver(observer: businessman, selector: #selector(businessman.appWillEnterForeground), name: UIApplication.willEnterForegroundNotification)
        addObserver(observer: businessman, selector: #selector(businessman.appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification)
        
        addObserver(observer: doctor, selector: #selector(doctor.appWillEnterForeground), name: UIApplication.willEnterForegroundNotification)
        addObserver(observer: doctor, selector: #selector(doctor.appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification)
        
        addObserver(observer: pensioner, selector: #selector(pensioner.appWillEnterForeground), name: UIApplication.willEnterForegroundNotification)
        addObserver(observer: pensioner, selector: #selector(pensioner.appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification)
        
        government.taxLevel = 10
        government.selary = 1100
        government.pension = 2000
        government.avetagePrice = 11
        
         print("didFinishLaunchingWithOptions")
        return true
    }
    
    func addObserver(observer: Any, selector: Selector, name: NSNotification.Name?){
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: nil)
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("didDiscardSceneSessions")
    }
}


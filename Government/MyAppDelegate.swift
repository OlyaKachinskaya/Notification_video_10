//
//  MyAppDelegate.swift
//  Government
//
//  Created by Оля Качинская on 16.03.2021.
//
import Foundation
import UIKit
//супермен
class MyAppDelegate: NSObject {
    
    func AddAllObservers()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIScene.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIScene.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillDeactivate), name: UIScene.willDeactivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidActivate), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidDisconnect), name: UIScene.didDisconnectNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillConnect), name: UIScene.willConnectNotification, object: nil)
    }
    
    @objc func appDidEnterBackground(sender: UIApplication) {
        print("MyAppDelegate: sceneDidEnterBackground")
    }
    
    @objc func appWillEnterForeground(sender: UIApplication) {
        print("MyAppDelegate: sceneWillEnterForeground")
    }
    
    @objc func appWillDeactivate(sender: UIApplication) {
        print("MyAppDelegate: sceneWillResignActive")
    }
    
    @objc func appDidActivate(sender: UIApplication) {
        print("MyAppDelegate: sceneDidBecomeActive")
    }
    
    @objc func appDidDisconnect(sender: UIApplication) {
        print("MyAppDelegate: sceneDidDisconnect")
    }
    
    @objc func appWillConnect(sender: UIApplication) {
        print("MyAppDelegate: sceneConnectionOptions")
    }
}


//
//  AppDelegate.swift
//  Bankey
//
//  Created by User 2 on 29/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
//        window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingViewController()
        
        return true
    }




}


//
//  AppDelegate.swift
//  iCal
//
//  Created by Maiqui Cedeño on 10/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup
        setupView()

        return true
    }
    
    //MARK: - Private functions
    func setupView() {
        
        //UIScreen.main.bounds = entire screen.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
    
}


//
//  AppDelegate.swift
//  Movie
//
//  Created by Ezgı Mac on 2.11.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        let navigationController = UINavigationController(rootViewController: viewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
}

//
//  AppDelegate.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // - UI
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configure()
        return true
    }

}

// MARK: -
// MARK: - Configure

private extension AppDelegate {
    
    func configure() {
        configureStartScreen()
    }
    
    func configureStartScreen() {
        window = UIWindow()
        let rootViewController = UIStoryboard(storyboard: .library).instantiateInitialViewController() as! LibraryViewController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}



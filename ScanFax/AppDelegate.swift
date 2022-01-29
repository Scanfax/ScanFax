//
//  AppDelegate.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit
import Qonversion

var hasActiveSubscription: Bool {
    return PremiumManager.shared.hasActiveSubscription()
}


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
        configureQonversion()
        configureStartScreen()
    }
    
    func configureQonversion() {
        Qonversion.launch(withKey: "4FIVLtg5czIAY-EMMTpSY5Fofojaijiwq")
        Qonversion.checkPermissions { (permissions, _) in
            if let premium = permissions[AppConstant.permissonName] {
                PremiumManager.shared.setSubscription(enable: premium.isActive)
            }
        }
        PremiumManager.shared.completeTransaction()
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



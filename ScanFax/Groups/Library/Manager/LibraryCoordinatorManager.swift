//
//  LibraryCoordinatorManager.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

class LibraryCoordinatorManager {
    
    // - UI
    private unowned var viewController: LibraryViewController
    
    // - Manager
    //private var userDefaultsManager = UserDefaultsManager()
    
    init(viewController: LibraryViewController) {
        self.viewController = viewController
    }
    
    func showOnboardingScreen() {
//        let isNotFirstLaunch = userDefaultsManager.getValue(data: .isNotFirstLaunch)
//        if !isNotFirstLaunch {
        guard !viewController.isFirst else { return }
        viewController.isFirst = true
            let onboardingViewController = UIStoryboard(storyboard: .onboarding).instantiateInitialViewController() as! OnboardingViewController
        onboardingViewController.delegate = viewController
            viewController.present(onboardingViewController, animated: true, completion: nil)
     //   }
    }
    
    func showPremiumScreen() {
        let navigationController = UINavigationController()
        navigationController.modalTransitionStyle = .coverVertical
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: false)
        let premiumViewController = UIStoryboard(storyboard: .premium, bundle: nil).instantiateInitialViewController() as! PremiumViewController
        //vc.delegate = viewController
        navigationController.viewControllers = [premiumViewController]
        viewController.present(navigationController, animated: true, completion: nil)
    }

}

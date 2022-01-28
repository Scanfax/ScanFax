//
//  OnboardingLayoutManager.swift
//  ScanFax
//
//  Created by YoungHafner on 26/01/2022.
//

import UIKit

class OnboardingLayoutManager {
    
    // - UI
    private unowned let viewController: OnboardingViewController
    
    init(viewController: OnboardingViewController) {
        self.viewController = viewController
    }
    
    func updateCurrentProgress(currentPage: Int) {
        switch currentPage {
        case 0:
            viewController.firstPageView.backgroundColor = AppColor.black()
            viewController.secondPageView.backgroundColor = AppColor.black(alpha: 0.2)
            viewController.thirdPageView.backgroundColor = AppColor.black(alpha: 0.2)
        case 1:
            viewController.firstPageView.backgroundColor = AppColor.black(alpha: 0.2)
            viewController.secondPageView.backgroundColor = AppColor.black()
            viewController.thirdPageView.backgroundColor = AppColor.black(alpha: 0.2)
        case 2:
            viewController.firstPageView.backgroundColor = AppColor.black(alpha: 0.2)
            viewController.secondPageView.backgroundColor = AppColor.black(alpha: 0.2)
            viewController.thirdPageView.backgroundColor = AppColor.black()
        default:
            print("do nothing")
        }
        
    }
    
}

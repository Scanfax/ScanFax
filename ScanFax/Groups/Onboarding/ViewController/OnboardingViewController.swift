//
//  OnboardingViewController.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstPageView: UIView!
    @IBOutlet weak var secondPageView: UIView!
    @IBOutlet weak var thirdPageView: UIView!
    
    // - Manager
    private let userDefaultsManager = UserDefaultsManager()
    private var layoutManager: OnboardingLayoutManager!
    
    // - Delegate
    weak var delegate: OnboardingViewControllerDelegate?
    
    // - Data
    private var viewModels = [OnboardingCellViewModel]()
    private var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        moveCells()
    }
}

//MARK: -
//MARK: - UICollectionView DataSource

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let viewModel = viewModels[indexPath.row]
        cell.setup(viewModel: viewModel)
        return cell
    }
    
}

//MARK: -
//MARK: - UICollectionView Delegate

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView:  UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = collectionView.bounds.size.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let numberOfPage = scrollView .contentOffset.x / scrollView.frame.size.width
        currentPage = Int(numberOfPage)
        layoutManager.updateCurrentProgress(currentPage: currentPage)
    }
    
}

// MARK: -
// MARK: - Transitions

private extension OnboardingViewController {
   
    func moveCells() {
        if currentPage == 2 {
            //userDefaultsManager.saveValue(value: true, data: .isNotFirstLaunch)
            dismiss(animated: true) { [weak self] in
                self?.delegate?.showSubscription()
            }
        } else {
            let item = collectionView.visibleCells[0]
            let currentIndexPath = collectionView.indexPath(for: item)
            self.collectionView.scrollToItem(at: IndexPath(item: currentIndexPath!.item + 1, section: 0), at: .left, animated: true)
        }
    }
    
}

// MARK: -
// MARK: - Configure

private extension OnboardingViewController {
    
    func configure() {
        configureLayoutManager()
        configurePageControl()
        configureViewModels()
        configureCollectionView()
    }
    
    func configureLayoutManager() {
        layoutManager = OnboardingLayoutManager(viewController: self)
    }
    
    func configurePageControl() {
        layoutManager.updateCurrentProgress(currentPage: currentPage)
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    
    func configureViewModels() {
        let firstCellViewModel = OnboardingCellViewModel(title: "SCAN, EDIT, SEND", subtitle: "Turn your iPhone into a powerful document scanner", imageName: "onboarding_first")
        let secondCellViewModel = OnboardingCellViewModel(title: "TEXT RECOGNITION", subtitle: "Convert any scan  into text that can be copied", imageName: "onboarding_second")
        let thirdCellViewModel = OnboardingCellViewModel(title: "SEND WORLDWIDE", subtitle: "Send a fax to 90+ countries from your iPhone", imageName: "onboarding_third")
        viewModels = [firstCellViewModel, secondCellViewModel, thirdCellViewModel]
    }
    
}

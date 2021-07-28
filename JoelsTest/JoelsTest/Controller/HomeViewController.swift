//
//  HomeViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit
import Anchorage

class HomeViewController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    var scrollView = UIScrollView()
    var scrollContextView = UIView()
    var headerView = UIStackView()
    var scrollViewDelegate: UIScrollViewDelegate?
    var userImage: UIImageView =  UIImageView(image: UIImage(systemName: "person.crop.circle")!)
    var mainHeaderContentStackView = UIStackView()
    var nameLabel = UILabel()
    var lastNameLabel = UILabel()
    var segmentedControl = UISegmentedControl()
    var labelContainerStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureUI()
        buildUI()
        displayDefaultUI()
    }
    
    func configureUI () {
        view.backgroundColor = .white
        headerView.backgroundColor = .white
        headerView.distribution = .fillEqually
        headerView.axis = .vertical
        headerView.spacing = DrawingConstants.spacing
        segmentedControl = UISegmentedControl(items: ["Personales", "profesionales", "expediente"])
        segmentedControl.selectedSegmentIndex = 0
        nameLabel.text = "Joel"
        lastNameLabel.text = "Alcantara"
        scrollViewDelegate = self
        scrollView.contentSize.height = DrawingConstants.scrollViewContent
        labelContainerStackView.axis = .vertical
        labelContainerStackView.distribution = .fillEqually
        labelContainerStackView.alignment = .leading
        mainHeaderContentStackView.axis = .horizontal
        mainHeaderContentStackView.spacing = DrawingConstants.spacing
    }
    
    func buildUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContextView)
        scrollContextView.addSubview(headerView)
        headerView.addArrangedSubview(mainHeaderContentStackView)
        headerView.addArrangedSubview(segmentedControl)
        mainHeaderContentStackView.addArrangedSubview(userImage)
        mainHeaderContentStackView.addArrangedSubview(labelContainerStackView)
        labelContainerStackView.addArrangedSubview(nameLabel)
        labelContainerStackView.addArrangedSubview(lastNameLabel)
    }
    
    func displayDefaultUI() {
        scrollView.edgeAnchors == view.layoutMarginsGuide.edgeAnchors
        scrollContextView.edgeAnchors == view.layoutMarginsGuide.edgeAnchors
        headerView.topAnchor == scrollContextView.topAnchor + 5
        headerView.horizontalAnchors == scrollContextView.horizontalAnchors
        userImage.heightAnchor == DrawingConstants.userImageHeight
        userImage.widthAnchor == DrawingConstants.userImageHeight
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "sideMenu").withRenderingMode(.alwaysTemplate).withTintColor(.black),
            style: .plain,
            target: self,
            action: #selector(handleMenuToggle)
        )
    }
    
}

extension HomeViewController : UIScrollViewDelegate {
    struct DrawingConstants {
        static let labelHeight: CGFloat = 40.0
        static let headerHeight: CGFloat = 200.0
        static let scrollViewContent: CGFloat = 2000.0
        static let userImageHeight: CGFloat = 45.0
        static let spacing: CGFloat = 8.0
    }
    
}

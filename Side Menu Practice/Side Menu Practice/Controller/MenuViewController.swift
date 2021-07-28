//
//  MenuViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit
import Anchorage

private let reusableIdentifier = "MenuItemCell"

class MenuViewController: UIViewController {
    
    var containerView = UIView()
    var menuHeaderStackView = UIStackView()
    var imageView = UIImageView(image: UIImage(systemName: "applelogo")!)
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var tableView = UITableView()
    var delegate: HomeControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        buildUI()
        displayDefaultUI()
    }
    
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCellMenuItem.self, forCellReuseIdentifier: reusableIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        menuHeaderStackView.spacing = 5
        menuHeaderStackView.axis = .vertical
        menuHeaderStackView.distribution = .fill
        menuHeaderStackView.alignment = .center
        nameLabel.font = .systemFont(ofSize: 14, weight: .bold)
        nameLabel.text = "Apple.inc"
        nameLabel.textColor = .black
        descriptionLabel.text = "lorem ipsum dolor sit"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .medium)
        descriptionLabel.textColor = .gray
    }
    
    func buildUI() {
        view.addSubview(containerView)
        view.addSubview(tableView)
        containerView.addSubview(menuHeaderStackView)
        menuHeaderStackView.addArrangedSubview(imageView)
        menuHeaderStackView.addArrangedSubview(nameLabel)
        menuHeaderStackView.addArrangedSubview(descriptionLabel)
    }
    
    func displayDefaultUI() {
        containerView.horizontalAnchors == view.horizontalAnchors
        containerView.topAnchor == view.topAnchor + DrawingConstants.spacing
        containerView.heightAnchor == DrawingConstants.imageHeight + (DrawingConstants.labelHeight * 2)
        menuHeaderStackView.edgeAnchors == containerView.edgeAnchors
        tableView.widthAnchor == view.widthAnchor
        tableView.bottomAnchor == view.bottomAnchor
        tableView.topAnchor == menuHeaderStackView.bottomAnchor
        imageView.heightAnchor == DrawingConstants.imageHeight
        imageView.widthAnchor == DrawingConstants.imageHeight
    }
    

}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! UITableViewCellMenuItem
        let menuOption = MenuOptions(rawValue: indexPath.row)
        cell.iconImageView.image = menuOption?.image
        cell.descriptionLabel.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOptions(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}

extension MenuViewController : UIScrollViewDelegate {
    struct DrawingConstants {
        static let labelHeight: CGFloat = 20.0
        static let imageHeight: CGFloat = 45.0
        static let spacing: CGFloat = 8.0
    }
    
}

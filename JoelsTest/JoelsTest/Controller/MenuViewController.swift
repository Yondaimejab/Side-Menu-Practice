//
//  MenuViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit

private let reusableIdentifier = "MenuItemCell"

class MenuViewController: UIViewController {
    
    var imageView = UIImageView(image: #imageLiteral(resourceName: "imagePlaceHolder"))
    var tableView : UITableView!
    var delegate: HomeControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        configureImageview()
        configureTableView()
        // Do any additional setup after loading the view.
        
    }
    
    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCellMenuItem.self, forCellReuseIdentifier: reusableIdentifier)
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = .gray
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor	)
            ])
    }
    
    func configureImageview() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            ,imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalTo:self.view.heightAnchor, multiplier: 0.20)])
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

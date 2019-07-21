//
//  HomeViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    var scrollView: UIScrollView!
    var scrollContextView: UIView!
    var headerView: UIView!
    var scrollViewDelegate: UIScrollViewDelegate?
    var userImage: UIImageView! = {
        return UIImageView(image: #imageLiteral(resourceName: "logout"))
    }()
    var nombreLabel: UILabel!
    var apellidoLabel: UILabel!
    var segmentedControl : UISegmentedControl!
    var labelcontainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configureNavigationBar()
        setScrollView()
        setHeaderView()
    }
    
    @objc func handleMenuToggle() 	{
        print("ToggleMenu")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func setHeaderView(){

        headerView = UIView()
        headerView.frame = CGRect(x:0, y: 0, width: self.view.frame.width, height: 200)
        scrollContextView.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo:self.view.topAnchor),
           headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        headerView.backgroundColor = .white
        headerView.addSubview(userImage)
         labelcontainerView = UIView()
            headerView.addSubview(labelcontainerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo:self.view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.10),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        setImageView()
       setLabelContainerView()
        
        
        segmentedControl = UISegmentedControl(items: ["Personales","profesionales","expediente"])
         segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.leftAnchor.constraint(equalTo: headerView.leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: headerView.rightAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            segmentedControl.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.1)
            ])
        segmentedControl.selectedSegmentIndex = 0
        
    }
    
    func setLabelContainerView(){
        labelcontainerView.translatesAutoresizingMaskIntoConstraints  = false
        nombreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: labelcontainerView.frame.width / 2, height: 40))
        apellidoLabel = UILabel(frame: CGRect(x: 0, y: 0,width: labelcontainerView.frame.width / 2,height: 40))
        nombreLabel.text = "sample text"
        apellidoLabel.text = "sample text"
        NSLayoutConstraint.activate([
            labelcontainerView.topAnchor.constraint(equalTo:userImage.topAnchor),
            labelcontainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            labelcontainerView.heightAnchor.constraint(equalTo:self.view.heightAnchor,multiplier: 0.1),
            labelcontainerView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])
        labelcontainerView.addSubview(nombreLabel)
        labelcontainerView.addSubview(apellidoLabel)
        setLabel(label: nombreLabel)
        setLabel(label: apellidoLabel)
        
        NSLayoutConstraint.activate([
            nombreLabel.leftAnchor.constraint(equalTo: labelcontainerView.leftAnchor),
            apellidoLabel.rightAnchor.constraint(equalTo: labelcontainerView.rightAnchor)
            ])
    }
    
    func setLabel(label: UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: labelcontainerView.topAnchor),
            label.bottomAnchor.constraint(equalTo: labelcontainerView.bottomAnchor)
            ])
    }
    
    func setImageView(){
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo:self.view.topAnchor),
            userImage.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.2),
            
           userImage.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
           userImage.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            userImage.heightAnchor.constraint(equalTo:headerView.heightAnchor,multiplier: 0.5)
            ])
            userImage.layer.borderWidth = 0
            userImage.layer.masksToBounds = false
            userImage.layer.borderColor = UIColor.black.cgColor
            userImage.layer.cornerRadius = 40
            userImage.clipsToBounds = true
    }
    
    func configureNavigationBar(){
       navigationController?.navigationBar.barTintColor = .darkGray
	        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "sideMenu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func setScrollView(){
        scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        scrollViewDelegate = self
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 2000
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo:self.view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        scrollContextView = UIView()
        scrollView.addSubview(scrollContextView)
        scrollContextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollContextView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollContextView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollContextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollContextView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollContextView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            scrollContextView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        
    }
    
    
}

extension HomeViewController : UIScrollViewDelegate {
    
    
}

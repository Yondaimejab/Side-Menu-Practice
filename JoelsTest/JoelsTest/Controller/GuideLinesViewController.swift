//
//  GuideLinesViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/21/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit

class GuideLinesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        // Do any additional setup after loading the view.
    }
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func configure(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Guia de uso."
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleDismiss))
    }

}

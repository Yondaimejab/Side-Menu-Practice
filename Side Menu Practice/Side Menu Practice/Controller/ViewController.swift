//
//  ViewController.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var menuController: MenuViewController!
    var centerController: UIViewController!
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureHomeViewController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool  {
        return isExpanded
    }
    
    
    func configureHomeViewController() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        centerController = UINavigationController(rootViewController: homeViewController)
        view.addSubview(centerController.view)
        addChild(centerController)
        didMove(toParent: centerController)
    }
    
    func configureMenuController(){
        if menuController == nil {
            menuController = MenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
        
    }
    
    func animatePanel(ShouldExpand: Bool,menuOption: MenuOptions?){
        if ShouldExpand {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut,
                animations: {
                    self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0,
                options: .curveEaseInOut,
                animations: {
                    self.centerController.view.frame.origin.x = 0
                }) { (_) in
                    guard let mOption = menuOption  else { return }
                    self.didSelectMenuOption(menuOption: mOption)
                }
        }
        animateStatusbar()
    }
    
    func animateStatusbar(){
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: { self.setNeedsStatusBarAppearanceUpdate() },
            completion: nil
        )
    }
    
    func didSelectMenuOption(menuOption: MenuOptions){
        switch menuOption {
        case .UseGuides:
            let controller = GuideLinesViewController()
            present(UINavigationController(rootViewController: controller),animated:true)
        case .legalInfo:
            let controller = LegalInformationViewController()
            present(UINavigationController(rootViewController: controller),animated: true)
        default:
            let alert = UIAlertController(
                title: "Seguro que quiere salir.",
                message: "Tenga un buen dia",
                preferredStyle: .actionSheet
            )
            let action = UIAlertAction(title: "yes", style: .default){ (_) in
                exit(EXIT_SUCCESS)
            }
            let cancelAction = UIAlertAction(title:"no", style: .cancel,handler: nil)
            alert.addAction(action)
            alert.addAction(cancelAction)
            present(alert, animated:true)
        }
    }

}

extension ViewController : HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(ShouldExpand: isExpanded, menuOption: menuOption)
    }
}



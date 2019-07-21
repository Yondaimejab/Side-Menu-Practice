//
//  MenuOptions.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import Foundation
import UIKit

enum MenuOptions : Int, CustomStringConvertible{
    case UseGuides
    case legalInfo
    case logOut
    
    var description: String {
        switch self {
        case .UseGuides:
            return "Guia de uso."
        case .legalInfo:
            return "Informacion legal."
        default:
            return "Cerrar session."
        }
    }
    
    var image: UIImage {
        switch self {
        case .UseGuides:
            return UIImage(#imageLiteral(resourceName: "question")) ?? UIImage()
        case .legalInfo:
            return UIImage(#imageLiteral(resourceName: "exclamation"))
        default:
            return UIImage(#imageLiteral(resourceName: "logout"))
        }
    }
    
}

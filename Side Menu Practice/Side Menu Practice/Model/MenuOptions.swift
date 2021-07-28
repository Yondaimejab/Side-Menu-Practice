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
            return "Uso"
        case .legalInfo:
            return "Informacion"
        default:
            return "Salir"
        }
    }
    
    var image: UIImage {
        switch self {
        case .UseGuides:
            return UIImage(systemName: "questionmark.circle")!.withTintColor(.black)
        case .legalInfo:
            return UIImage(systemName: "exclamationmark.circle")!.withTintColor(.black)
        default:
            return UIImage(systemName: "xmark.circle")!.withTintColor(.black)
        }
    }
    
}

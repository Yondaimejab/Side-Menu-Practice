//
//  BaseViewModel.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/21/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import Foundation

class BaseViewModel {
    var whileLoading: (() -> Void) = { }
    var whenLoaded: (() -> Void) = { }
    var whenLoadedWithParameters: ((Any) -> Void) = { _ in }
    var onError: ((String) -> Void) = { _ in }
}


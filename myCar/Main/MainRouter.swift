//
//  MainRouter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol MainRouterInput: AnyObject {
    
}


class MainRouter: MainRouterInput {

    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    
}

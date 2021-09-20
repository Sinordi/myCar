//
//  NewFileRouter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation



class NewCarRouter: NewCarRouterProtocol {

    weak var viewController: NewCarViewController!
    
    init(viewController: NewCarViewController) {
        self.viewController = viewController
    }
}

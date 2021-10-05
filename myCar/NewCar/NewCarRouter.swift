//
//  NewFileRouter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol NewCarRouterInput: AnyObject {
    
}

class NewCarRouter: NewCarRouterInput {

    weak var viewController: NewCarViewController!
    
    init(viewController: NewCarViewController) {
        self.viewController = viewController
    }
}

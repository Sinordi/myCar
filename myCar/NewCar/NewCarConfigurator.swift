//
//  NewFileConfigurator.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol NewCarConfiguratorInput: AnyObject {
    func configure(with viewController: NewCarViewController)
}

class NewCarConfigurator: NewCarConfiguratorInput {
    
    func configure(with viewController: NewCarViewController) {
        
        let interactor = NewCarInteractor(dataManager: DataManagerImplementation(), coreDataService: CoreDataService())
        let router = NewCarRouter(viewController: viewController)
        let presenter = NewCarPresenter(view: viewController, interactor: interactor, router: router)

        
        viewController.presenter = presenter
        viewController.delegate = presenter
        interactor.delegate = presenter

    }
    
    
}

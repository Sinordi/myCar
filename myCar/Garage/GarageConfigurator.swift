//
//  GarageConfigurator.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol GarageConfiguratorInput: AnyObject {
    func configure(with viewController: GarageViewController)
}

class GarageConfigurator {
    
    
    func configure(with viewController: GarageViewController) {
        
        let interactor = GarageInteractor(coreDataService: CoreDataService())
        let router = GarageRouter(viewController: viewController)
        let presenter = GaragePresenter(view: viewController, interactor: interactor, router: router)

        
        viewController.presenter = presenter
        viewController.delegate = presenter
        interactor.delegate = presenter

    }
    
    
}

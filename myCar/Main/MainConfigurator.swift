//
//  MainConfigurator.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol MainConfiguratorInput: AnyObject {
    func configure(with viewController: MainViewController)
}

class MainConfigurator {
    
    func configure(with viewController: MainViewController) {
        let router = MainRouter(viewController: viewController)
        let interactor = MainInteractor(dataManager: DataManagerImplementation(), coreDataService: CoreDataService())
        let presenter = MainPresenter(view: viewController, interactor: interactor, router: router)
            
        viewController.presenter = presenter
        viewController.delegate = presenter
        interactor.delegate = presenter

    }  
}

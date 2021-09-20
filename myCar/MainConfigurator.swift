//
//  MainConfigurator.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class MainConfigurator: MainConfiguratorProtocol {
    
    
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        let dataManager = DataManagerImplementation()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}

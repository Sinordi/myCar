//
//  NewFileConfigurator.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class NewCarConfigurator: NewCarConfiguratorProtocol {
    
    
    func configure(with viewController: NewCarViewController) {
        let presenter = NewCarPresenter(view: viewController)
        let interactor = NewCarInteractor(presenter: presenter)
        let router = NewCarRouter(viewController: viewController)
        let dataManager = DataManagerImplementation()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.dataManager = dataManager
    }
    
    
}

//
//  GaragePresenter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class GaragePresenter: GaragePresenterProtocol {
    

    weak var view: GarageViewProtocol!
    var interactor: GarageInteractorProtocol!
    var router: GarageRouterProtocol!
    
    init(view: GarageViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        
    }
    
    func addNewCarButtonClicked() {
        router.showNewCarViewController()
    }
    
    
}

//
//  GaragePresenter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import CoreData

protocol GaragePresenterInput: AnyObject {
}

class GaragePresenter: GaragePresenterInput, GarageViewDelegate, GarageInteractorDelegate {

    private weak var view: GarageViewInput!
    private let interactor: GarageInteractorInput
    private let router: GarageRouterInput
    
    init(view: GarageViewInput, interactor: GarageInteractorInput, router: GarageRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsReady() {
        interactor.loadCarArray()
    }
    
    func didLoadCars() {
        guard let carArray = interactor.carArray else {return}
        self.view.getCarArray(carArray: carArray)
    }

    
    func addNewCarButtonClicked() {
        router.showNewCarViewController()
    }
    
    func removeCarFromGarageClicked(with objectID: NSManagedObjectID) {
        interactor.deliteCarFromGarage(with: objectID)
    }
}

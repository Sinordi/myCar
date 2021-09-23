//
//  GaragePresenter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


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
        guard let carArray = interactor.carArray else {return}
        self.view.getCarArray(carArray: carArray)
        var carBrandArray: [String] = []
        for index in 0..<carArray.count {
            carBrandArray.append(carArray[index].carBrand ?? "")
        }
        self.view?.getCarArrayString(carArrayString: carBrandArray)
    }

    
    func addNewCarButtonClicked() {
        router.showNewCarViewController()
    }
    
    func removeCarFromGarageClicked(with indexPath: IndexPath) {
        interactor.deliteCarFromGarage(with: indexPath)
    }
    
    func updateCarArrayInMainView(with carArray: [String]) {
        router.updateCarArrayInMainView(with: carArray)
    }
    
    
    
    
}

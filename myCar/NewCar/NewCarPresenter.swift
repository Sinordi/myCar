//
//  NewCarPresenter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol NewCarPresenterInput: AnyObject {

}

class NewCarPresenter: NewCarPresenterInput, NewCarViewDelegate, NewCarInteractorDelegate {

    private weak var view: NewCarViewInput!
    private let interactor: NewCarInteractorInput
    private let router: NewCarRouterInput
    
    init(view: NewCarViewInput, interactor: NewCarInteractorInput, router: NewCarRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsReady() {
        interactor.obtainCarBrandsFromSQLDataBase()
    }
    
    func carBrandDidChoose(with brand: String) {
        interactor.obtainCarModelsFromSQLDataBase(with: brand)
    }
    
    func addNewCarButtonClicked(carBrand: String, carModel: String, carType: String?, carGeneration: String?, carMileage: Int32) {
        interactor.addNewCar(carBrand: carBrand, carModel: carModel, carType: carType, carGeneration: carGeneration, carMileage: carMileage)
    }
    
    func didObtainCarBrandsFromSQLDataBase() {
        guard let brands = interactor.brands else {return}
        self.view.getBrandsFromSQLDataBase(with: brands)
    }
    
    func didObtainCarModelsFromSQLDataBase() {
        guard let models = interactor.models else {return}
        self.view.getModelsFromSQLDataBase(with: models)
    }
}

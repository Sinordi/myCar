//
//  MainPresenter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol MainPresenterInput: AnyObject {
}

class MainPresenter: MainPresenterInput, MainViewDelegate, MainInteractorDelegate {

    private weak var view: MainViewInput?
    private let interactor: MainInteractorInput
    private let router: MainRouterInput
    
    init(view: MainViewInput, interactor: MainInteractorInput, router: MainRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsReady() {
        
        //Добавление авто на главный экран
//        interactor.loadMainCarItem()
        
        //Создание массива брендов из существующих авто
        guard let carArray = interactor.carArray else {return}
        self.view?.getCarArray(carArray: carArray)
        
        var carBrandArray: [String] = []
        for index in 0..<carArray.count {
            carBrandArray.append(carArray[index].brand ?? "")
        }
        self.view?.getCarArrayString(carArray: carBrandArray)
    }
    
    func didLoadCars() {

        guard let carArray = interactor.carArray else {return}
        self.view?.getCarArray(carArray: carArray)

        var carBrandArray: [String] = []
        for index in 0..<carArray.count {
            carBrandArray.append(carArray[index].brand ?? "")
        }
        self.view?.getCarArrayString(carArray: carBrandArray)
    }
    
    func carMileageDidChange(carMileage: Int32, index: Int) {
        interactor.carMileageChange(mileage: carMileage, index: index)
    }
    
    func didUpdateMileage() {
        guard let carArray = interactor.carArray else {return}
        self.view?.getCarArray(carArray: carArray)
    }
}

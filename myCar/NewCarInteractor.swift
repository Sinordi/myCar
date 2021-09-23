//
//  NewCarInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class NewCarInteractor: NewCarInteractorInput {

    
    
    weak var delegate: NewCarInteractorDelegate?
    private let dataManager: DataManager
    private let coreDataService: CoreDataService
    
    init(dataManager: DataManager, coreDataService: CoreDataService) {
        self.dataManager = dataManager
        self.coreDataService = coreDataService
    }
    

    func obtainArrayOfMarksOfCars() -> [String] {
        
        let cars = dataManager.obtainMarksOfCars()
        return cars
    }
    
    func addNewCar(carBrand: String, carModel: String, carType: String?, carGeneration: String?, carMileage: Int32) {
        coreDataService.saveNewCarItem(with: MainAuto(carBrand: carBrand, carModel: carModel, generation: carGeneration, trim: carType, carMileage: carMileage))
    }
}

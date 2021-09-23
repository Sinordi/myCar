//
//  MainInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class MainInteractor: MainInteractorInput {


    private var actualValue2: Auto?
    
    var mainCar: Auto? {
        set {
             actualValue2 = newValue
        }
        get {
            return coreDataService.carItemArray.first
        }
    }
    
    var carArray: [Auto]? {
        get {
            return coreDataService.carItemArray
        }
    }
    
    weak var delegate: MainInteractorDelegate?
    private let dataManager: DataManager
    private let coreDataService: CoreDataService
    
  
    init(dataManager: DataManager, coreDataService: CoreDataService) {
        self.dataManager = dataManager
        self.coreDataService = coreDataService

    }
    
    func loadMainCarItem() {
        coreDataService.loadAuto()
    }
    
    func deliteFirstCar() {
        coreDataService.removingAllCarsFromCoreData()
    }
    
    
    func carMileageChange(carMileage: Int32) {
        mainCar?.carMileage = carMileage
    }
    
}

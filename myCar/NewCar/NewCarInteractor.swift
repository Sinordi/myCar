//
//  NewCarInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation

protocol NewCarInteractorInput: AnyObject {
    var brands: [String]? {get}
    var models: [String]? {get}
    func obtainCarBrandsFromSQLDataBase()
    func obtainCarModelsFromSQLDataBase(with brand: String)
    func addNewCar(carBrand: String, carModel: String, carType: String?, carGeneration: String?, carMileage: Int32)
}

protocol NewCarInteractorDelegate: AnyObject {
    func didObtainCarBrandsFromSQLDataBase()
    func didObtainCarModelsFromSQLDataBase()
}


class NewCarInteractor: NewCarInteractorInput {
    
    weak var delegate: NewCarInteractorDelegate?
    private let sqliteDataService: SQLiteDataService
    private let coreDataService: CoreDataService
    
    var brands: [String]? {
        get {
            return sqliteDataService.brands
        }
    }
    var models: [String]? {
        get {
            return sqliteDataService.models
        }
    }
    
    func obtainCarBrandsFromSQLDataBase() {
        sqliteDataService.obtainCarBrands()
        delegate?.didObtainCarBrandsFromSQLDataBase()
    }
    
    func obtainCarModelsFromSQLDataBase(with brand: String) {
        sqliteDataService.obtainCarModels(with: brand)
        delegate?.didObtainCarModelsFromSQLDataBase()
    }
    
    init(sqliteDataService: SQLiteDataService, coreDataService: CoreDataService) {
        self.sqliteDataService = sqliteDataService
        self.coreDataService = coreDataService
    }
    

    func addNewCar(carBrand: String, carModel: String, carType: String?, carGeneration: String?, carMileage: Int32) {
        coreDataService.saveNewCarItem(with: MainAuto(brand: carBrand, model: carModel, generation: carGeneration, trim: carType, mileage: carMileage))
    }
}

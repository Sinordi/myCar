//
//  GarageInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class GarageInteractor: GarageInteractorInput {
    

    
      
    private let coreDataService: CoreDataService
    weak var delegate: GarageInteractorDelegate?
    
  
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    
    var carArray: [Auto]? {
        get {
            return coreDataService.carItemArray
        }
    }
    
    
    func loadCarArray() {
        coreDataService.loadAuto()
    }
    
    
    func deliteCarFromGarage(with indexPath: IndexPath) {
        coreDataService.removingCarWithIndex(with: indexPath)
    }
}

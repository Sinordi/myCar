//
//  NewCarInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class NewCarInteractor: NewCarInteractorProtocol {
    
    weak var presenter: NewCarPresenterProtocol!
    var dataManager: DataManager!
    
  
    init(presenter: NewCarPresenterProtocol) {
        self.presenter = presenter
    }
    

    func obtainArrayOfMarksOfCars() -> [String] {
        
        let cars = dataManager.obtainMarksOfCars()
        return cars
    }
}

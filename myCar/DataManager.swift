//
//  DataManager.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


protocol DataManager {
    
    func obtainMarksOfCars() -> [String]
}

class DataManagerImplementation: DataManager {
    
    
    
    func obtainMarksOfCars() -> [String] {
        return ["Skoda", "Mitsubishi", "BMW", "Lada", "Audi", "Seat"]
    }
    
    
}

//
//  DataManager.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import SQLite


protocol SQLiteDataServiceInput {
    func obtainCarBrands()
    func obtainCarModels(with brand: String)

}

class SQLiteDataService: SQLiteDataServiceInput {
    
    var dataBase: Connection?
    var brands = [String]()
    var models = [String]()
    let cars = Table("car_db")
    let brand = Expression<String?>("brand")
    let model = Expression<String>("model")
    let filePath = Bundle.main.url(forResource: "cars", withExtension: "db")

    
    func obtainCarBrands() {
        do {
            dataBase = try Connection(filePath?.path ?? "")
            for car in try dataBase!.prepare(cars) {
                guard let brand = car[brand] else {return}
                brands.append(brand)
                brands = brands.unique
            }
        } catch {
            print("obtainCarBrands Ошибочка вышла")
        }
    }
    
    func obtainCarModels(with brand: String) {
        models = []
        do {
            dataBase = try Connection(filePath?.path ?? "")
            for car in try dataBase!.prepare(cars.filter(self.brand == "\(brand)")) {
                models.append(car[model])
                models = models.unique
            }
        } catch {
            print("obtainCarModels Ошибочка вышла")
        }
        
    }
    
    


}

extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

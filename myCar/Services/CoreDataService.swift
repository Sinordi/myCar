//
//  CoreDataService.swift
//  myCar
//
//  Created by Сергей Кривошапко on 22.09.2021.
//

import Foundation
import UIKit
import CoreData



protocol CoreDataInput: AnyObject {
    func saveNewCarItem(with auto: MainAuto)
    func removingAllCarsFromCoreData()
    func removingCarWithIndex(with indexPath: IndexPath)
    func saveAuto()
    func loadAuto()
}


class CoreDataService: CoreDataInput {
    
    var carItemArray = [Car]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    //Сохранение автомобиля в базу данных
    func saveNewCarItem(with auto: MainAuto) {
        
        let carItem = Car(context: context)
            carItem.brand = auto.brand
            carItem.mileage = (auto.mileage ?? 0)
            carItem.model = auto.model
            carItem.generation = auto.generation
            carItem.trim = auto.trim
//        self.carItemArray.append(carItem)
        self.saveAuto()
        print("Я сохранил новый автомобиль")
    }
    
    //удаляет все из CoreData
    func removingAllCarsFromCoreData() {
        for item in 0..<carItemArray.count {
            context.delete(carItemArray[item])
            saveAuto()
        }
    }
    
    //Удаляет элемент с определенным индексом
    func removingCarWithIndex(with indexPath: IndexPath) {
        context.delete(carItemArray[indexPath.row])
        saveAuto()
    }
    
    //Метод сохранения контекста
    func saveAuto() {
        do {
           try self.context.save()
            print("Я сохранил")
        } catch {
            print("Не удалось сохранить данные \(error)")
        }
    }
    
    //Метод загрузки данных из Core Data
    func loadAuto() {
        let request: NSFetchRequest<Car> = Car.fetchRequest()
        do {
            carItemArray = try context.fetch(request)
        } catch {
            print("Не удалось загрузить данные \(error)")
        }
    }
    
    
      
}

//
//  MainInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import CoreData

protocol MainInteractorInput: AnyObject {
    
    var carArray: [Car]? {get}
    var mainCar: Car? {get set}
    func carMileageChange(mileage: Int32, index: Int)
//    func loadMainCarItem()
}

protocol MainInteractorDelegate: AnyObject {
    func didLoadCars()
    func didUpdateMileage()
}


class MainInteractor: NSObject, MainInteractorInput {

    private var actualCar: Car?
    private var frConroller: NSFetchedResultsController<Car> = NSFetchedResultsController<Car>()
    weak var delegate: MainInteractorDelegate?
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
        super.init()
        self.sibscribeToCarUpdates()

    }

    var carArray: [Car]? {
        get {
            coreDataService.loadAuto()
            return coreDataService.carItemArray
        }
    }
    
    var mainCar: Car? {
        set {
             actualCar = newValue
        }
        get {
            return coreDataService.carItemArray.first
        }
    }
    
//    func loadMainCarItem() {
//        coreDataService.loadAuto()
//    }
    
    //Изменение пробега + защита от скручивания (нельзя указать значение меньше, чем было)
    func carMileageChange(mileage: Int32, index: Int) {
        guard let oldValueOfMileage = carArray?[index].mileage else {return}
        if oldValueOfMileage < mileage {
            coreDataService.updatingCarMileage(mileage: mileage, index: index)
            delegate?.didUpdateMileage()
        } else {
            return
        }
    }
    
    
    //Функция, необходимая для отслеживания изменений в CoreData
    private func sibscribeToCarUpdates() {
        let context = coreDataService.context
        let fetchRequest = NSFetchRequest<Car>(entityName: "Car")
        // Configure the request's entity, and optionally its predicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "brand", ascending: false)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: context,
                                                    sectionNameKeyPath: nil,
                                                    cacheName: nil)
        controller.delegate = self
        self.frConroller = controller
        
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
}

extension MainInteractor: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        coreDataService.loadAuto()
        delegate?.didLoadCars()
    }
}

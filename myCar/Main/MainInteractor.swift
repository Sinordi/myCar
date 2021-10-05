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
    func carMileageChange(mileage: Int32)
    func loadMainCarItem()
    func deliteFirstCar()
}

protocol MainInteractorDelegate: AnyObject {
    func didLoadCars()
}


class MainInteractor: NSObject, MainInteractorInput {


    private var actualValue2: Car?
    private var frConroller: NSFetchedResultsController<Car> = NSFetchedResultsController<Car>()
    
    var mainCar: Car? {
        set {
             actualValue2 = newValue
        }
        get {
            return coreDataService.carItemArray.first
        }
    }
    
    var carArray: [Car]? {
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
        self.sibscribeToCarUpdates()
        coreDataService.loadAuto()
    }
    
    func deliteFirstCar() {
        coreDataService.removingAllCarsFromCoreData()
    }
    
    
    func carMileageChange(mileage: Int32) {
        mainCar?.mileage = mileage
    }
    
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

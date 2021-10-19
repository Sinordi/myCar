//
//  GarageInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import CoreData


protocol GarageInteractorInput: AnyObject {
    var carArray: [Car]? {get}
    func loadCarArray()
    func deliteCarFromGarage(with objectID: NSManagedObjectID)
}

protocol GarageInteractorDelegate: AnyObject {
    func didLoadCars()
}

class GarageInteractor: NSObject, GarageInteractorInput {
       
    private let coreDataService: CoreDataService
    weak var delegate: GarageInteractorDelegate?
    private var frConroller: NSFetchedResultsController<Car>?
    
  
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
        super.init()
        self.sibscribeToCarUpdates()
    }
    
    
    var carArray: [Car]? {
        get {
            return coreDataService.carItemArray
        }
    }
    
    func deliteCarFromGarage(with objectID: NSManagedObjectID) {
        coreDataService.removingCarWithIndex(with: objectID)
    }
    
    func loadCarArray() {
        coreDataService.loadAuto()
        delegate?.didLoadCars()
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

extension GarageInteractor: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.loadCarArray()
    }
}

//
//  GarageProtocols.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


protocol GarageViewInput: AnyObject {
    func getCarArray(carArray: [Auto])
    func getCarArrayString(carArrayString: [String])
}

protocol GarageViewDelegate: AnyObject {
    func viewIsReady()
    
}

protocol GaragePresenterInput: AnyObject {
    func addNewCarButtonClicked()
    func removeCarFromGarageClicked(with indexPath: IndexPath)
    func updateCarArrayInMainView(with carArray: [String])
}



protocol GarageInteractorInput: AnyObject {
    var carArray: [Auto]? {get}
    func loadCarArray()
    func deliteCarFromGarage(with indexPath: IndexPath)
}

protocol GarageInteractorDelegate: AnyObject {
    
}


protocol GarageRouterInput: AnyObject {
    func showNewCarViewController()
    func updateCarArrayInMainView(with carArray: [String])
}

protocol GarageConfiguratorInput: AnyObject {
    func configure(with viewController: GarageViewController)
}

//
//  GarageRouter.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class GarageRouter: GarageRouterInput {
    

    
    

    
    
    weak var GarageViewController: GarageViewController!

    weak var MainViewController: MainViewController!
    
    init(viewController: GarageViewController) {
        self.GarageViewController = viewController
    }
    
    
    func showNewCarViewController() {
        print("Я открыл новый экран добавления авто")
        GarageViewController.performSegue(withIdentifier: "GarageToNewCarSegue", sender: nil)
    }
    
    
    
    //TODO:- Реализовать метод, при котором обновляется segmented controll при удалении автомобиля из гаража

    func updateCarArrayInMainView(with carArray: [String]) {
//        self.MainViewController.carArrayString = carArray
        print("Я должен удалить из сегмент контрола")
    }
    
}

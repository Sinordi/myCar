//
//  MainProtocols.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


protocol MainViewInput: AnyObject {
    func setMainCarOnMainView(auto: Auto)
    func getCarArray(carArray: [Auto])
    func getCarArrayString(carArray: [String])
    
//    func creatingSegmentedControl(wift array: [String])
}

protocol MainViewDelegate: AnyObject { //outPut
    func viewIsReady()
    func carMileageDidChange(carMileage: Int32)
    func deliteFirstCarButtonClicked()
}

protocol MainPresenterInput: AnyObject {
    
}



protocol MainInteractorInput: AnyObject {
    
    var carArray: [Auto]? {get}
    var mainCar: Auto? {get set}
    func carMileageChange(carMileage: Int32)
    func loadMainCarItem()
    func deliteFirstCar()
}

protocol MainInteractorDelegate: AnyObject {
    
}


protocol MainRouterInput: AnyObject {
    
}

protocol MainConfiguratorInput: AnyObject {
    func configure(with viewController: MainViewController)
}

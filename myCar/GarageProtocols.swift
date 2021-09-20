//
//  GarageProtocols.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


protocol GarageViewProtocol: AnyObject {
    
}

protocol GaragePresenterProtocol: AnyObject {
    var router: GarageRouterProtocol! {get set}
    func configureView()
    func addNewCarButtonClicked()
}


protocol GarageInteractorProtocol: AnyObject {

}


protocol GarageRouterProtocol: AnyObject {
    func showNewCarViewController()
}

protocol GarageConfiguratorProtocol: AnyObject {
    func configure(with viewController: GarageViewController)
}

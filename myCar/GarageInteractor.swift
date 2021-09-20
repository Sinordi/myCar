//
//  GarageInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class GarageInteractor: GarageInteractorProtocol {
    
    weak var presenter: GaragePresenterProtocol!
    
  
    init(presenter: GaragePresenterProtocol) {
        self.presenter = presenter
    }
}

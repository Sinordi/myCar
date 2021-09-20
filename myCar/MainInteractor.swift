//
//  MainInteractor.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    
  
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}

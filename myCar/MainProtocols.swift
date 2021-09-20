//
//  MainProtocols.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    
}

protocol MainPresenterProtocol: AnyObject {
    var router: MainRouterProtocol! {get set}
    func configureView()
    
}


protocol MainInteractorProtocol: AnyObject {

}


protocol MainRouterProtocol: AnyObject {
    
}

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

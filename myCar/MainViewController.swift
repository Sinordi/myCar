//
//  ViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    var presenter: MainPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}


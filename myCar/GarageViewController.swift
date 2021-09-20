//
//  GarageViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation



import UIKit

class GarageViewController: UIViewController, GarageViewProtocol {
    
    
    var configurator: GarageConfiguratorProtocol = GarageConfigurator()
    var presenter: GaragePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        presenter.addNewCarButtonClicked()
    }
    
}

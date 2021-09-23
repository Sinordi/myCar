//
//  NewCarController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import UIKit


class NewCarViewController: UIViewController, NewCarViewInput {
    
    
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carTypeTextField: UITextField!
    @IBOutlet weak var carGenerationTextField: UITextField!
    @IBOutlet weak var carMileageTextField: UITextField!
    
    
    var presenter: NewCarPresenterInput!
    weak var delegate: NewCarViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewCarConfigurator().configure(with: self)
        delegate?.viewIsReady()
        
    }
    
    
    @IBAction func addCarButtonClicked(_ sender: UIButton) {
        let carMileage = Int32(Int(carMileageTextField.text ?? "") ?? 0)
        self.delegate?.addNewCarButtonClicked(carBrand: carBrandTextField.text ?? "", carModel: carModelTextField.text ?? "", carType: carTypeTextField.text, carGeneration: carGenerationTextField.text, carMileage: carMileage)
        self.dismiss(animated: true, completion: nil)
    }
    
}

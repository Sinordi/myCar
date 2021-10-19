//
//  NewCarController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import UIKit

protocol NewCarViewInput: AnyObject {
    func getBrandsFromSQLDataBase(with brands: [String])
    func getModelsFromSQLDataBase(with models: [String])
}

protocol NewCarViewDelegate: AnyObject {
    func viewIsReady()
    func carBrandDidChoose(with brand: String)
    func addNewCarButtonClicked(carBrand: String, carModel: String, carType: String?, carGeneration: String?, carMileage: Int32)
}


class NewCarViewController: UIViewController, NewCarViewInput, UITextFieldDelegate {


    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carTypeTextField: UITextField!
    @IBOutlet weak var carGenerationTextField: UITextField!
    @IBOutlet weak var carMileageTextField: UITextField!
    var brandPickerView = UIPickerView()
    var modelPickerView = UIPickerView()
    var presenter: NewCarPresenterInput!
    weak var delegate: NewCarViewDelegate?
    var brands: [String] = []
    var models: [String] = ["NET"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewCarConfigurator().configure(with: self)
        delegate?.viewIsReady()
        creatingPickerViews()
        carTypeTextField.delegate = self
        carGenerationTextField.delegate = self
        carMileageTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.view.frame.origin.y -= 340
        
    }
    
    
    func creatingPickerViews() {
        brandPickerView.dataSource = self
        brandPickerView.delegate = self
        modelPickerView.dataSource = self
        modelPickerView.delegate = self
        
        carBrandTextField.inputView = brandPickerView
        carModelTextField.inputView = modelPickerView
        
        carModelTextField.isHidden = true
        carTypeTextField.isHidden = true
        carGenerationTextField.isHidden = true
        carMileageTextField.isHidden = true
    }
    
    
    @IBAction func addCarButtonClicked(_ sender: UIButton) {
        let carMileage = Int32(Int(carMileageTextField.text ?? "") ?? 0)
        self.delegate?.addNewCarButtonClicked(carBrand: carBrandTextField.text ?? "", carModel: carModelTextField.text ?? "", carType: carTypeTextField.text, carGeneration: carGenerationTextField.text, carMileage: carMileage)
        self.dismiss(animated: true, completion: nil)
    }
    
    func getModelsFromSQLDataBase(with models: [String]) {
        self.models = models
    }
    
    func getBrandsFromSQLDataBase(with brands: [String]) {
        self.brands = brands
    }
}

extension NewCarViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == brandPickerView {
            return brands.count
        } else if pickerView == modelPickerView {
            return models.count
        } else {return 1}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == brandPickerView {
            return brands[row]
        } else if pickerView == modelPickerView {
            return models[row]
        } else { return nil}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == brandPickerView {
            carBrandTextField.text = brands[row]
            delegate?.carBrandDidChoose(with: brands[row])
            brandPickerView.resignFirstResponder()
            self.view.endEditing(true)
            carModelTextField.isHidden = false
            print(models)
            
        } else if pickerView == modelPickerView {
            carModelTextField.text = models[row]
            modelPickerView.resignFirstResponder()
            self.view.endEditing(true)
            carTypeTextField.isHidden = false
            carGenerationTextField.isHidden = false
            carMileageTextField.isHidden = false
        }
    }
    
    
}



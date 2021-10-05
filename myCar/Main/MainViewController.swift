//
//  ViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import UIKit

protocol MainViewInput: AnyObject {
    func setMainCarOnMainView(auto: Car)
    func getCarArray(carArray: [Car])
    func getCarArrayString(carArray: [String])
    
//    func creatingSegmentedControl(wift array: [String])
}

protocol MainViewDelegate: AnyObject { //outPut
    func viewIsReady()
    func carMileageDidChange(carMileage: Int32)
    func deliteFirstCarButtonClicked()
}



class MainViewController: UIViewController, MainViewInput, UITextFieldDelegate {

    @IBOutlet weak var autoTitle: UILabel!
    @IBOutlet weak var odometrTextField: UITextField!
    @IBOutlet weak var odometrLabel: UILabel!
    
    @IBOutlet weak var carsSegmentedControll: UISegmentedControl!
    var carSegmentedControll = UISegmentedControl()

    var presenter: MainPresenterInput!
    weak var delegate: MainViewDelegate?
    private var carArray: [Car] = []
    var carArrayString: [String] = []
    
    let wight = UIScreen.main.bounds.size.width
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MainConfigurator().configure(with: self)
        delegate?.viewIsReady()
        creatingSegmentedControll(with: carArrayString)
    }
    
    
    //MARK: - Segmented Controll
    func creatingSegmentedControll(with items: [String]) {
        self.carSegmentedControll = UISegmentedControl(items: items)
        self.carSegmentedControll.frame = CGRect(x: 20, y: 550, width: (wight - 40), height: 30)
        self.view.addSubview(carSegmentedControll)
        carSegmentedControll.addTarget(self, action: #selector(carSegmentedControllDidChanche), for: .valueChanged)
    }
    
    
    //Изменение пробега
    @IBAction func carMileageDidChancheTextField(_ sender: UITextField) {
        self.delegate?.carMileageDidChange(carMileage: (Int32(sender.text ?? "") ?? 0))
    }
    
    
    //Segmented Controll method
    @objc func carSegmentedControllDidChanche(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    
    @IBAction func deliteButtonClicked(_ sender: UIButton) {
        self.delegate?.deliteFirstCarButtonClicked()
        self.delegate?.viewIsReady()
    }
    
    
    func setMainCarOnMainView(auto: Car) {
        autoTitle.text = (auto.brand ?? "") + " " + (auto.model ?? "")
        odometrLabel.text = "Пробег: " + String(auto.mileage) + " км"
    }
    
    func getCarArray(carArray: [Car]) {
        self.carArray = carArray
    }
    
    func getCarArrayString(carArray: [String]) {
        self.carArrayString = carArray

    }
}


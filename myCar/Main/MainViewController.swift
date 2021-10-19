//
//  ViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import UIKit

protocol MainViewInput: AnyObject {
    func getCarArray(carArray: [Car])
    func getCarArrayString(carArray: [String])
}

protocol MainViewDelegate: AnyObject { //outPut
    func viewIsReady()
    func carMileageDidChange(carMileage: Int32, index: Int)
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
    private var actualIndexOfCar: Int = 0
    
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
        self.carSegmentedControll.frame = CGRect(x: 20, y: 50, width: (wight - 40), height: 30)
        self.view.addSubview(carSegmentedControll)
        carSegmentedControll.addTarget(self, action: #selector(carSegmentedControllDidChanche), for: .valueChanged)
    }
    
    
    //Изменение пробега
    @IBAction func carMileageDidChancheTextField(_ sender: UITextField) {
        self.delegate?.carMileageDidChange(carMileage: (Int32(sender.text ?? "") ?? 0), index: actualIndexOfCar)
        sender.text = ""
    }
    
    
    
    //Segmented Controll method
    @objc func carSegmentedControllDidChanche(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        setMainCar(with: carArray, at: sender.selectedSegmentIndex)
    }
    
    func getCarArray(carArray: [Car]) {
        self.carArray = carArray
        self.setMainCar(with: carArray, at: actualIndexOfCar)
    }
    
    func getCarArrayString(carArray: [String]) {
        self.carArrayString = carArray
        carSegmentedControll.removeAllSegments()

        carArrayString.enumerated().forEach { index, title in
            carSegmentedControll.insertSegment(withTitle: title, at: index, animated: false)
        }
        
        

    }
    
    func setMainCar(with car: [Car], at index: Int) {
        if car.count != 0 {
            actualIndexOfCar = index
            autoTitle.text = (car[index].brand ?? "") + " " + (car[index].model ?? "")
            odometrLabel.text = "Пробег: " + String(car[index].mileage) + " км"
        } else {
            autoTitle.text = "Нет авто"
            odometrLabel.text = "0"
        }
        
    }
}


//
//  ViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewInput, UITextFieldDelegate {

    @IBOutlet weak var autoTitle: UILabel!
    @IBOutlet weak var odometrTextField: UITextField!
    @IBOutlet weak var odometrLabel: UILabel!
    
    @IBOutlet weak var carsSegmentedControll: UISegmentedControl!
    var carSegmentedControll = UISegmentedControl()

    
    
    var presenter: MainPresenterInput!
    weak var delegate: MainViewDelegate?
    private var carArray: [Auto] = []
    var carArrayString: [String] = []
    
    let wight = UIScreen.main.bounds.size.width

    override func viewDidLoad() {
        super.viewDidLoad()
        MainConfigurator().configure(with: self)
        delegate?.viewIsReady()
        
        //MARK: - Segmented Controll
        self.carSegmentedControll = UISegmentedControl(items: carArrayString)
        self.carSegmentedControll.frame = CGRect(x: 20, y: 550, width: (wight - 40), height: 30)
        self.view.addSubview(carSegmentedControll)
    }
    
    @IBAction func carMileageDidChancheTextField(_ sender: UITextField) {
        self.delegate?.carMileageDidChange(carMileage: (Int32(sender.text ?? "") ?? 0))
    }
    
    @IBAction func deliteButtonClicked(_ sender: UIButton) {
        self.delegate?.deliteFirstCarButtonClicked()
        self.delegate?.viewIsReady()
    }
    
    func setMainCarOnMainView(auto: Auto) {
        autoTitle.text = (auto.carBrand ?? "") + " " + (auto.carModel ?? "")
        odometrLabel.text = "Пробег: " + String(auto.carMileage) + " км"
        
    }
    
    func getCarArray(carArray: [Auto]) {
        self.carArray = carArray
    }
    
    func getCarArrayString(carArray: [String]) {
        self.carArrayString = carArray
    }
}










extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailReusableCell", for: indexPath)
        return cell
    }
}


//
//  GarageViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation



import UIKit

class GarageViewController: UIViewController, GarageViewInput {

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: GaragePresenterInput!
    weak var delegate: GarageViewDelegate?
    var carArray: [Auto] = []
    var carArrayString: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        GarageConfigurator().configure(with: self)
        delegate?.viewIsReady()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GarageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableGarageCell")
        self.tableView.rowHeight = 130
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("GarageViewDidAppear")
        GarageConfigurator().configure(with: self)
        delegate?.viewIsReady()
    }

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        presenter.addNewCarButtonClicked()
        
        
    }
    
    //TODO:- Переименовать или убрать этот функционал в другое место
    func getCarArray(carArray: [Auto]) {
        self.carArray = carArray
    }
    
    func getCarArrayString(carArrayString: [String]) {
        self.carArrayString = carArrayString
    }
}




extension GarageViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - TableView Data Sourse methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableGarageCell", for: indexPath) as! GarageTableViewCell
        cell.carBrandLabel.text = carArray[indexPath.row].carBrand
        cell.carModelLabel.text = carArray[indexPath.row].carModel
        cell.carMileageLabel.text = String(carArray[indexPath.row].carMileage)
        return cell
    }
    
    //MARK: - TableView Delegate methods

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.removeCarFromGarageClicked(with: indexPath)
        self.carArray.remove(at: indexPath.row)
        self.carArrayString.remove(at: indexPath.row)
        presenter.updateCarArrayInMainView(with: carArrayString)
        tableView.reloadData()
    }

}

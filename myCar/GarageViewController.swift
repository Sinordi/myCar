//
//  GarageViewController.swift
//  myCar
//
//  Created by Сергей Кривошапко on 20.09.2021.
//

import Foundation
import UIKit

protocol GarageViewInput: AnyObject {
    func getCarArray(carArray: [Car])
    func getCarArrayString(carArrayString: [String])
}

protocol GarageViewDelegate: AnyObject {
    func viewIsReady()
    func removeCarFromGarageClicked(with indexPath: IndexPath)
    func addNewCarButtonClicked()
    
}

class GarageViewController: UIViewController, GarageViewInput {


    @IBOutlet weak var tableView: UITableView!
    
    var presenter: GaragePresenterInput!
    weak var delegate: GarageViewDelegate?
    var carArray: [Car] = []
    var carArrayString: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        GarageConfigurator().configure(with: self)
        delegate?.viewIsReady()
        creatingTableView()
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        print("GarageViewDidAppear")
//        GarageConfigurator().configure(with: self)
//        delegate?.viewIsReady()
//    }
    
    func creatingTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "GarageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableGarageCell")
        self.tableView.rowHeight = 130
    }

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        self.delegate?.addNewCarButtonClicked()    
    }
    
    //TODO:- Переименовать или убрать этот функционал в другое место
    func getCarArray(carArray: [Car]) {
        self.carArray = carArray
        tableView.reloadData()
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
        cell.carBrandLabel.text = carArray[indexPath.row].brand
        cell.carModelLabel.text = carArray[indexPath.row].model
        cell.carMileageLabel.text = String(carArray[indexPath.row].mileage)
        return cell
    }
    
    //MARK: - TableView Delegate methods

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.delegate?.removeCarFromGarageClicked(with: indexPath)
//        self.carArray.remove(at: indexPath.row)
//        self.carArrayString.remove(at: indexPath.row)
//        tableView.reloadData()
    }
}


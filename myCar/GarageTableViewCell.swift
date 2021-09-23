//
//  GarageTableViewCell.swift
//  myCar
//
//  Created by Сергей Кривошапко on 23.09.2021.
//

import UIKit

class GarageTableViewCell: UITableViewCell {

    @IBOutlet weak var carBrandLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carMileageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

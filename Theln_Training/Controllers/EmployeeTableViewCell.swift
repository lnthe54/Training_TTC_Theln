//
//  EmployeeTableViewCell.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/5/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var didTapEdit: (() -> Void)?
    var didTapDelete: (() ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(withEmployee employee: EmployeeObject) {
        nameLabel.text = employee.name
        addressLabel.text = employee.address
        sexLabel.text = employee.isMale ? "Nam" : "Nữ"
        positionLabel.text = employee.position.rawValue
    }
    
    // MARK: - IBAction
    @IBAction func editEmployeeAction(_ sender: Any) {
        didTapEdit?()
    }
    
    @IBAction func deleteEmployeeAction(_ sender: Any) {
        didTapDelete?()
    }
    
}

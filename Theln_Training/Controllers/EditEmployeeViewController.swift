//
//  EditEmployeeViewController.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/5/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import UIKit

protocol EditEmployeeViewControllerDelegate {
    func editEmployee(employee: EmployeeObject)
}

class EditEmployeeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var generButton: UISwitch!
    
    var employee: EmployeeObject?
    var employeeObject: EmployeeObject!
    
    var delegate: EditEmployeeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let employee = employee {
            employeeObject = employee
            nameTextField.text = employee.name
            addressTextField.text = employee.address
            generButton.isOn = employee.isMale
        }
    }
    
    private func saveInfo() -> EmployeeObject {
        if let name = nameTextField.text {
            employeeObject.name = name
        }
        
        if let address = addressTextField.text {
            employeeObject.address = address
        }
        
        employeeObject.isMale = generButton.isOn
        return employeeObject
    }
    
    @IBAction func closeController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchGener(_ sender: Any) {
        
    }
    
    @IBAction func completeEdit(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegate?.editEmployee(employee: self.saveInfo())
        })
    }
}

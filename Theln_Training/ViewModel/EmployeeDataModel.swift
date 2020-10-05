//
//  EmployeeDataModel.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/5/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import UIKit

class EmployeeDataModel: EditEmployeeViewControllerDelegate {
    
    static let shared = EmployeeDataModel()
    let connection = TheLNConnection()
    var editEmployee: ((EmployeeObject) -> Void)?
    
    func fetchData(completion: @escaping ([EmployeeObject]) -> Void) {
        connection.postRequest { (response: EmployeeContainerObject) in
            if let data = response.employees {
                completion(data)
            }
        }
    }
    
    func showAlert(controller: UIViewController, message: String, deleteAction: @escaping () -> Void) {
        let alert = UIAlertController(title: "Thông Báo ", message: "Bạn có chắc chắn muốn xóa nhân viên \(message) ?", preferredStyle: .alert)
        let agreeAction = UIAlertAction(title: "Đồng ý", style: .destructive) { (action) in
            deleteAction()
        }
        let cancelAction = UIAlertAction(title: "Hủy", style: .default) { (action) in
            // do something
        }
        
        alert.addAction(cancelAction)
        alert.addAction(agreeAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showPopupEditEmployee(controller: UIViewController, employee: EmployeeObject, editAction: @escaping (EmployeeObject) -> Void) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let editEmployeeViewController = main.instantiateViewController(withIdentifier: "EditEmployeeViewController") as! EditEmployeeViewController
        editEmployeeViewController.employee = employee
        editEmployeeViewController.delegate = self
        editEmployee = editAction
        controller.present(editEmployeeViewController, animated: true, completion: nil)
    }
    
    // MARK: - EditEmployeeViewControllerDelegate
    func editEmployee(employee: EmployeeObject) {
        editEmployee?(employee)
    }
}

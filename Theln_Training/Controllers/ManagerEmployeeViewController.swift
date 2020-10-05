//
//  ViewController.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/2/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import UIKit

class ManagerEmployeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlet
    @IBOutlet weak var employeeTableView: UITableView!
    
    var listEmployee = [EmployeeObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
    }
    
    // MARK: - Init data
    private func initData() {
        EmployeeDataModel.shared.fetchData { employees in
            self.listEmployee = employees
            self.employeeTableView.reloadData()
        }
    }
    
    private func deleteEmployee(_ index: Int) {
        let employee = listEmployee[index]
        EmployeeDataModel.shared.showAlert(controller: self, message: employee.name, deleteAction: {
            self.listEmployee.remove(at: index)
            self.employeeTableView.reloadData()
        })
    }
    
    private func editEmployee(_ index: Int) {
        EmployeeDataModel.shared.showPopupEditEmployee(controller: self, employee: self.listEmployee[index], editAction: { employee in
            self.listEmployee[index] = employee
            self.employeeTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        cell.bindData(withEmployee: listEmployee[indexPath.row])
        cell.didTapEdit = {
            self.editEmployee(indexPath.row)
        }
        
        cell.didTapDelete = {
            self.deleteEmployee(indexPath.row)
        }
        return cell
    }
}


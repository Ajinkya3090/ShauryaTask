//
//  EmployeeDetailViewController.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableVIew: UITableView!
    var empolyeeDetail: Employee?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableVIew.dataSource = self
    }
}

extension EmployeeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = detailTableVIew.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else {return UITableViewCell()}
        if let employeData = empolyeeDetail {
            cell.setData(employeeData: employeData)
        }
        return cell
    }
}

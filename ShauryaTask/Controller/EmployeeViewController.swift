//
//  ViewController.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    var employeeVM = EmployeeListViewModel()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableEmployeeView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        tableEmployeeView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        tableEmployeeView.dataSource = self
        tableEmployeeView.delegate = self
        employeeVM.delegate = self
        activityIndicator.startAnimating()
        employeeVM.getEmployeeData()
    }
}

extension EmployeeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeVM.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableEmployeeView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell else {return UITableViewCell()}
        let employee = employeeVM.employees[indexPath.row]
        cell.lblName.text = "Name : " + employee.name
        cell.lblMobileNumber.text = "Mobile No. : " + employee.mobileNo
        cell.lblAddress.text = employee.address
        cell.imgProfile.downloaded(from: employee.profilePhoto)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as? EmployeeDetailViewController {
            controller.empolyeeDetail = employeeVM.employees[indexPath.row]
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension EmployeeViewController: EmployeeViewModelDelegate {
    func didRecevieEmployeeDetails() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableEmployeeView.reloadData()
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

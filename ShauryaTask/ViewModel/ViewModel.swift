//
//  ViewModel.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import Foundation

protocol EmployeeViewModelDelegate: AnyObject {
    func didRecevieEmployeeDetails()
}

class EmployeeListViewModel {
    weak var delegate: EmployeeViewModelDelegate?
    var employees = [Employee]()
    func getEmployeeData() {
        let urlStr = "http://measervicetest.erpguru.in/service.asmx/getAllMemberListForMenu?MemberId=347"
        ApiCall.shared.apiCall(url: urlStr) { result in
            self.employees = result?.data1 ?? []
            self.delegate?.didRecevieEmployeeDetails()
        }
    }
}

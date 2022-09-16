//
//  DetailTableViewCell.swift
//  ShauryaTask
//
//  Created by admin on 16/09/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblMemberId: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblMiddleName: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(employeeData: Employee) {
        imgProfile.downloaded(from: employeeData.profilePhoto)
        lblMemberId.text = "MemberId : \(employeeData.memberID)"
        lblFirstName.text = "First Name : " + employeeData.firstName
        lblMiddleName.text = "Middle Name : " + employeeData.middleName
        lblLastName.text = "Last Name : " + employeeData.lastName
        lblMobileNumber.text = "Mobile No. " + employeeData.mobileNo
    }
}

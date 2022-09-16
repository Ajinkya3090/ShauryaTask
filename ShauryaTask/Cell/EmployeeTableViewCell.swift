//
//  EmployeeTableViewCell.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

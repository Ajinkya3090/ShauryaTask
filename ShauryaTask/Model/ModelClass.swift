//
//  ModelClass.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import Foundation

struct EmployeeData: Codable {
    let data: String
    let data1: [Employee]
}

struct Employee: Codable {
    let memberID: Int
    let memberName: String
    let profilePhoto: String
    let mobileNo, organizationid, organizationName, address: String
    let data1Description, firstName, middleName, lastName: String
    let name: String
    let isChatBlock: Bool
    
    enum CodingKeys: String, CodingKey {
        case memberID = "MemberId"
        case memberName = "MemberName"
        case profilePhoto = "ProfilePhoto"
        case mobileNo = "MobileNo"
        case organizationid = "Organizationid"
        case organizationName = "OrganizationName"
        case address = "Address"
        case data1Description = "Description"
        case firstName = "FirstName"
        case middleName = "MiddleName"
        case lastName = "LastName"
        case name = "Name"
        case isChatBlock = "IsChatBlock"
    }
}

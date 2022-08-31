//
//  SignUpModel.swift
//  Foreman
//
//  Created by Aarish on 30/08/22.
//

import Foundation

struct SignUpModel: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var address: String = ""
    var age: String = ""
    var experience: String = ""
    var date: Int = 0
    var jobProfile: String = ""
}
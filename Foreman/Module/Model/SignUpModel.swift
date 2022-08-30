//
//  SignUpModel.swift
//  Foreman
//
//  Created by Aarish on 30/08/22.
//

import Foundation

struct SignUpModel: Codable {
    let firstName: String?
    let lastName: String?
    let email: String?
    let address: String?
    let age: Int?
    let experience: Int?
    let date: Int?
}

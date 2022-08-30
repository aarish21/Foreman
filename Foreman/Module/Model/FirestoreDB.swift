//
//  FirestoreDB.swift
//  Foreman
//
//  Created by Aarish on 30/08/22.
//

import Foundation
import FirebaseDatabase
import FirebaseCore
class FirestoreDB {
    static func signUpUser(signUpData: SignUpModel, completion: @escaping(Error?) -> Void) {
        let value: [String: Any] = ["firstName": signUpData.firstName ?? "",
                                    "lastName": signUpData.lastName ?? "",
                                    "email": signUpData.email ?? "",
                                    "address": signUpData.address ?? "",
                                    "age": signUpData.age ?? 0,
                                    "experience": signUpData.experience ?? 0,
                                    "date": signUpData.date ?? 0]
        let ref = Database.database().reference().child("users")
        ref.setValue(value) { err, snap in
            if err != nil {
                completion(err)
            }
        }
    }
}

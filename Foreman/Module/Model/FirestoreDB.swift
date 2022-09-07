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
        let value: [String: Any] = ["firstName": signUpData.firstName ,
                                    "lastName": signUpData.lastName ,
                                    "email": signUpData.email ,
                                    "address": signUpData.address ,
                                    "age": signUpData.age ,
                                    "experience": signUpData.experience ,
                                    "date": signUpData.date,
                                    "jobProfile": signUpData.jobProfile]
        let ref = Database.database().reference().child("users").childByAutoId()
        
        ref.setValue(value) { err, _ in
            if err != nil {
                completion(err)
            }
        }
    }
    static func getData(email: String, password: String, completion: @escaping(DataSnapshot?) -> Void) {
        Database.database().reference().child("users").getData(completion: { err, snapshot in
            if err != nil {
                print(err!.localizedDescription)
            }
            completion(snapshot)
        })
           
//        ref.getData { err, snapshot in
//            if err != nil {
//                completion(nil, err)
//            } else {
//                completion(snapshot, nil)
//            }
//        }
    }
}

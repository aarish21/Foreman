//
//  Constants.swift
//  Foreman
//
//  Created by Aarish on 23/08/22.
//

import Foundation
import UIKit

struct Constants {
    static let signUpTitle = "Sign Up"
    static let tfCell = "TextfieldCell"

    static func getTopVC() -> UIViewController {
        let keyWin = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        var topMostViewController = keyWin?.rootViewController

        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        return topMostViewController!
    }
}

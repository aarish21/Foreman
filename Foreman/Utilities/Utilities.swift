//
//  Utilities.swift
//  Foreman
//
//  Created by Aarish on 24/08/22.
//

import UIKit

class Utilities {
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
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValid(_ name: String) -> Bool {
        let regex = "[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: name)
        
        return result
    }
    static func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60)
    }
}

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
}

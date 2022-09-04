//
//  Utilities.swift
//  Swift Collection
//
//  Created by Aarish on 16/08/22.
//

import Foundation
import UIKit
class ReusableAlert {
    func  presentAlertWithTitle(title: String, message: String?, options: String...,
                                completion: @escaping (Int) -> Void) {
        let keyWin = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        var topMostViewController = keyWin?.rootViewController

        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (_) in
                completion(index)
            }))
        }
        topMostViewController?.present(alertController, animated: true, completion: nil)
    }
}

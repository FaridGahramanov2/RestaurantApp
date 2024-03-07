//
//  UIViewController+Ext.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 22.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

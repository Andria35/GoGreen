//
//  AlertManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 22.01.24.
//

import UIKit

protocol Alerting {
    func displayAlert(message: String, buttonTitle: String, vc: UIViewController)
}

final class AlertManager: Alerting {
    func displayAlert(message: String, buttonTitle: String, vc: UIViewController)
    {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}

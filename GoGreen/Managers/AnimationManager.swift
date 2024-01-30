//
//  AnimationManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 31.01.24.
//

import UIKit

protocol Animating {
    func successAnimation(viewController: UIViewController)
}

final class AnimationManager: Animating {
    
    func successAnimation(viewController: UIViewController) {
        let checkmarkImageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        checkmarkImageView.tintColor = .green
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(checkmarkImageView)
        NSLayoutConstraint.activate([
            checkmarkImageView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            checkmarkImageView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 100),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        checkmarkImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            checkmarkImageView.transform = .identity
        }) { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                checkmarkImageView.alpha = 0.0
            }) { _ in
                checkmarkImageView.removeFromSuperview()
            }
        }
    }

}

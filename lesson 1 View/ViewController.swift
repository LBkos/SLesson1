//
//  ViewController.swift
//  lesson 1 View
//
//  Created by Константин Лопаткин on 01.03.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedView = UIView()
        roundedView.layer.insertSublayer(setGradientBackground(colorTop: .systemBlue, colorBottom: .systemRed), at: 0)
        roundedView.layer.shadowColor = UIColor.darkGray.cgColor
        roundedView.layer.shadowOpacity = 1
        roundedView.layer.shadowOffset = .zero
        roundedView.layer.shadowRadius = 10
        
        view.addSubview(roundedView)
        view.backgroundColor = .purple
        
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            roundedView.widthAnchor.constraint(equalToConstant: 100),
            roundedView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) -> CALayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = CGRect(x: 1, y: 1, width: 100, height: 100)
        gradientLayer.cornerRadius = 16
        

       return gradientLayer
    }
    

}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

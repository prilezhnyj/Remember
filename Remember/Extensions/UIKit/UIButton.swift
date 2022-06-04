//
//  UIButton.swift
//  Remember
//
//  Created by Максим Боталов on 05.06.2022.
//

import UIKit

extension UIButton {
    convenience init(titleText: String, titleColor: UIColor, titleFont: UIFont, backgroundColor: UIColor, isBorder: Bool) {
        self.init(type: .system)
        self.setTitle(titleText, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = titleFont
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isBorder == false {
            self.layer.shadowColor = SetupColor.blue().cgColor
            self.layer.shadowOpacity = 0.4
            self.layer.shadowRadius = 10
            self.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
        
        if isBorder == true {
            self.backgroundColor = .clear
            self.layer.borderColor = backgroundColor.cgColor
            self.layer.borderWidth = 1
        }
    }
}

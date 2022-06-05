//
//  CustomTextField.swift
//  Remember
//
//  Created by Максим Боталов on 05.06.2022.
//

import UIKit

class CustomTextField: UITextField {
    convenience init(placeholderText: String, font: UIFont, textColor: UIColor, isSecure: Bool) {
        self.init()
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        self.autocapitalizationType = .none
        self.borderStyle = .none
        self.clearButtonMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray2])
        
        if isSecure == true {
            self.isSecureTextEntry = true
        } else {
            self.isSecureTextEntry = false
        }
        
        let underline = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        underline.backgroundColor = SetupColor.blue()
        underline.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(underline)
        NSLayoutConstraint.activate([
            underline.heightAnchor.constraint(equalToConstant: 1),
            underline.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            underline.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        
    }
}

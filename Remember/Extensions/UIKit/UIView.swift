//
//  UIView.swift
//  Remember
//
//  Created by Максим Боталов on 05.06.2022.
//

import UIKit

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

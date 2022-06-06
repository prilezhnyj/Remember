//
//  SettingViewConroller.swift
//  Remember
//
//  Created by Максим Боталов on 06.06.2022.
//

import UIKit

class SettingViewConroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(loginOutAction))
    }
    
    @objc fileprivate func loginOutAction() {
        print("Выход пользователя")
    }
}

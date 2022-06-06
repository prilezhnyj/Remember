//
//  MainTabBarController.swift
//  Remember
//
//  Created by Максим Боталов on 06.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTabBarControllers()
    }
    
    private func settingsTabBarControllers() {
        let taskViewController = creationNavigationController(viewController: TaskViewController(), nameItem: "Задачи", nameImageItem: "list.dash")
        let noteViewController = creationNavigationController(viewController: NoteViewController(), nameItem: "Заметки", nameImageItem: "pencil.slash")
        let settingViewController = creationNavigationController(viewController: SettingViewConroller(), nameItem: "Настройки", nameImageItem: "gearshape")
        viewControllers = [taskViewController, noteViewController, settingViewController]
    }
    
    private func creationNavigationController(viewController: UIViewController, nameItem: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: nameItem, image: UIImage(systemName: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = false
        return navigationController
    }
}

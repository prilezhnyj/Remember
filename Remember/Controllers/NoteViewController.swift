//
//  NoteViewController.swift
//  Remember
//
//  Created by Максим Боталов on 06.06.2022.
//

import UIKit

class NoteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Заметки"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTaskAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(trashTaskAction))
    }
    
    @objc fileprivate func addNewTaskAction() {
        print("Новая заметка")
    }
    
    @objc fileprivate func trashTaskAction() {
        print("Удалённые заметки")
    }
}


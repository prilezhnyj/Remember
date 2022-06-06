//
//  TaskViewController.swift
//  Remember
//
//  Created by Максим Боталов on 06.06.2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    let taskTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Задачи"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTaskAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(trashTaskAction))
        
        setupConstraints()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - Only @objc methods
extension TaskViewController {
    @objc fileprivate func addNewTaskAction() {
        print("Новая заметка")
    }
    
    @objc fileprivate func trashTaskAction() {
        print("Удалённые заметки")
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = String(indexPath.row)
        cell.contentConfiguration = config
        return cell
    }
    
    
}

// MARK: - setupConstraints
extension TaskViewController {
    fileprivate func setupConstraints() {
        view.addSubview(taskTableView)
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}

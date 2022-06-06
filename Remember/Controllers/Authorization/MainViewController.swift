//
//  ViewController.swift
//  Remember
//
//  Created by Максим Боталов on 04.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let greetingLabel = UILabel(text: "👋🏻 Привет, это Remember", font: SetupFont.helveticaNeueBold(size: 24), textColor: SetupColor.blue(), textAlignment: .left)
    
    private let descriptionOneLabel = UILabel(text: "Приложение, созданное для того, чтобы вы не забывали свои дневные задачи и оставались продуктивными.", font: SetupFont.helveticaNeueRegular(size: 18), textColor: .black, textAlignment: .left)
    
    private let descriptionTwoLabel = UILabel(text: "Вы можете зарегистрироваться в приложении, чтобы в случае чего, ваши задачи и заметки всего были под рукой и никуда не исчезли.", font: SetupFont.helveticaNeueRegular(size: 18), textColor: .black, textAlignment: .left)
    
    private let descriptionThreeLabel = UILabel(text: "Или предложить без создания аккаунта, тогда в случае удаления приложения, все ваши записи удалятся.", font: SetupFont.helveticaNeueRegular(size: 18), textColor: .black, textAlignment: .left)
    
    private let loginInButton = UIButton(titleText: "Войти", titleColor: SetupColor.white(), titleFont: SetupFont.helveticaNeueRegular(size: 18), backgroundColor: SetupColor.blue(), isBorder: false)
    
    private let signUpButton = UIButton(titleText: "Регистрация", titleColor: SetupColor.blue(), titleFont: SetupFont.helveticaNeueRegular(size: 18), backgroundColor: SetupColor.blue(), isBorder: true)
    
    private let viewRed: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 227/255, green: 51/255, blue: 87/255, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.white()
        setupConstraints()
        
        loginInButton.addTarget(self, action: #selector(loginInButtonAction), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewRed.layer.cornerRadius = viewRed.frame.height / 2
        viewRed.clipsToBounds = true
    }
}

// MARK: - @objc action methods
extension MainViewController {
    @objc fileprivate func loginInButtonAction() {
        present(LoginInViewController(), animated: true, completion: nil)
    }
    
    @objc fileprivate func signUpButtonAction() {
        present(SignUpViewController(), animated: true, completion: nil)
    }
}

// MARK: - setupConstraints
extension MainViewController {
    fileprivate func setupConstraints() {
        view.addSubview(viewRed)
        NSLayoutConstraint.activate([
            viewRed.heightAnchor.constraint(equalToConstant: 500),
            viewRed.widthAnchor.constraint(equalToConstant: 500),
            viewRed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 170),
            viewRed.topAnchor.constraint(equalTo: view.topAnchor, constant: -80)])
        
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
        
        
        let descriptionLabelsStackView = UIStackView(arrangedSubviews: [descriptionOneLabel, descriptionTwoLabel, descriptionThreeLabel], distribution: .fill, axis: .vertical, spacing: 10, alignment: .fill)
        
        view.addSubview(descriptionLabelsStackView)
        NSLayoutConstraint.activate([
            descriptionLabelsStackView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20),
            descriptionLabelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
        
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 250),
            signUpButton.heightAnchor.constraint(equalToConstant: 45)])
        
        view.addSubview(loginInButton)
        NSLayoutConstraint.activate([
            loginInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10),
            loginInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginInButton.widthAnchor.constraint(equalToConstant: 250),
            loginInButton.heightAnchor.constraint(equalToConstant: 45)])
    }
}




//
//  SignUpViewController.swift
//  Remember
//
//  Created by Максим Боталов on 05.06.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let loginInLabel = UILabel(text: "Пройдите регистрацию", font: SetupFont.helveticaNeueBold(size: 24), textColor: SetupColor.blue(), textAlignment: .left)
    
    private let emailLabel = UILabel(text: "Ваш почтовый адрес", font: SetupFont.helveticaNeueRegular(size: 16), textColor: SetupColor.blue(), textAlignment: .left)
    private let emailTextField = CustomTextField(placeholderText: "Начните вводить ваш почтовый адрес", font: SetupFont.helveticaNeueRegular(size: 18), textColor: SetupColor.blue(), isSecure: false)
    
    private let passwordLabel = UILabel(text: "Придумайте пароль", font: SetupFont.helveticaNeueRegular(size: 16), textColor: SetupColor.blue(), textAlignment: .left)
    private let passwordTextField = CustomTextField(placeholderText: "Начните вводить ваш пароль", font: SetupFont.helveticaNeueRegular(size: 18), textColor: SetupColor.blue(), isSecure: true)
    
    private let confirmPasswordLabel = UILabel(text: "Повторите придуманный пароль", font: SetupFont.helveticaNeueRegular(size: 16), textColor: SetupColor.blue(), textAlignment: .left)
    private let confirmPasswordTextField = CustomTextField(placeholderText: "Начните вводить ваш пароль", font: SetupFont.helveticaNeueRegular(size: 18), textColor: SetupColor.blue(), isSecure: true)
    
    private let signUpButton = UIButton(titleText: "Зарегистрироваться", titleColor: SetupColor.blue(), titleFont: SetupFont.helveticaNeueRegular(size: 18), backgroundColor: SetupColor.blue(), isBorder: true)
    
    private let viewForTextField = UIView(backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.white()
        setupConstraints()
        registerForKeyboardNotification()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        viewForTextField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboardGesture)))
    }
    
    @objc fileprivate func signUpButtonAction() {
        print("Переход к заметкам")
    }
    
    deinit { removeForKeyboardNotification() }
}

// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text!)
    }
}
// MARK: - setupKeyboardAppear
extension SignUpViewController {
    @objc fileprivate func hideKeyboardGesture() {
        viewForTextField.endEditing(true)
    }
    
    fileprivate func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    fileprivate func removeForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height - 40
            viewForTextField.frame.origin.y = viewForTextField.frame.origin.y - keyboardHeight
        }
    }
    
    @objc fileprivate func keyboardWillHide(_ notification: NSNotification) {
        viewForTextField.frame.origin.y = .zero
    }
}

// MARK: - setupConstraints
extension SignUpViewController {
    fileprivate func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], distribution: .fill, axis: .vertical, spacing: 5, alignment: .fill)
        
        let emailAndPasswordtackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView], distribution: .fill, axis: .vertical, spacing: 20, alignment: .fill)
        
        view.addSubview(loginInLabel)
        NSLayoutConstraint.activate([
            loginInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            loginInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
        
        view.addSubview(viewForTextField)
        NSLayoutConstraint.activate([
            viewForTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewForTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        viewForTextField.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: viewForTextField.bottomAnchor, constant: -50),
            signUpButton.centerXAnchor.constraint(equalTo: viewForTextField.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 250),
            signUpButton.heightAnchor.constraint(equalToConstant: 45)])
        
        viewForTextField.addSubview(emailAndPasswordtackView)
        NSLayoutConstraint.activate([
            emailAndPasswordtackView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -50),
            emailAndPasswordtackView.leadingAnchor.constraint(equalTo: viewForTextField.leadingAnchor, constant: 20),
            emailAndPasswordtackView.trailingAnchor.constraint(equalTo: viewForTextField.trailingAnchor, constant: -20)])
    }
}

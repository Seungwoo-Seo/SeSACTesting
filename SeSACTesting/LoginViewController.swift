//
//  LoginViewController.swift
//  SeSACTesting
//
//  Created by 서승우 on 2023/12/11.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapButton(_ sender: UIButton) {
        if isValidEmail() && isValidPassword() && isEqualPassword() {
            print("성공")
        } else {
            print("실패")
        }
    }

    func isValidEmail() -> Bool {
        guard let check = emailTextField.text else {
            return false
        }

        return check.contains("@") && check.count >= 6
    }

    func isValidPassword() -> Bool {
        guard let check = passwordTextField.text else {
            return false
        }

        return check.count >= 6 && check.count < 10
    }

    func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text,
              let check = checkTextField.text else {
            return false
        }

        return password == check
    }

}

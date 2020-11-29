//
//  LoginViewController.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let emailText = emailLabel.text, let passwordText = passwordLabel.text else { return }
        viewModel.verifyLogin(email: emailText, password: passwordText) {
            sender.backgroundColor = .red
        }
    }
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
    }
}

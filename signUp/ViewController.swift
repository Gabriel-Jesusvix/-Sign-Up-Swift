//
//  ViewController.swift
//  signUp
//
//  Created by Gabriel Jesus on 09/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    // caputaramos os campos na aplicação
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    // método roda quando o app inicia viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setando config do teclado para cada input
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        /*
         atribuido o valor do campo.
         Similar ao changeText do React
        */
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        registerButton.isEnabled = false
        // Lógica para quando botão estiver desabilitado
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        // Lógica para quando botão estiver habilitado
        registerButton.setTitleColor(.white, for: .normal)
    }
    
   // Função para realizar alguma lógica ( neste caso, cadasdrar )
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
       print("Clicou")
    }
    
    // Método para validar campos vazios
    func validateTextFiled(){
        if(nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "") {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
}

extension ViewController: UITextFieldDelegate  {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Primeiro metodo a ser disparado
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
            
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Metodo chamado quando teclado desaparece
        print(#function)
        textField.layer.borderWidth = 0
        validateTextFiled()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Metodo acionado quando apertamos no return/enter
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

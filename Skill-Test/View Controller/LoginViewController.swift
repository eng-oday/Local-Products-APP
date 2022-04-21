//
//  LoginViewController.swift
//  Skill-Test
//
//  Created by Oday Dieg on 18/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var arrayOfTextFileds:[UITextField]     = []
    var dataModel                           = [ProductEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        SetupButton()

    }
    
    private func setupTextFields(){
        
        arrayOfTextFileds = [userNameTextField,passwordTextField]

        for everyTextField in arrayOfTextFileds {
            
            everyTextField.layer.cornerRadius   = 24
            everyTextField.layer.masksToBounds  = true
            everyTextField.clipsToBounds        = true
   
        }
    }
    
    
    private func SetupButton(){

        signInButton.layer.cornerRadius     = 20
        signInButton.layer.shadowColor      = UIColor(red: 229/255, green: 79/255, blue: 79/255, alpha: 0.25).cgColor
        signInButton.layer.shadowOffset     = CGSize(width: 5, height: 20)
        signInButton.layer.shadowOpacity    = 0.15
        signInButton.layer.masksToBounds    = false

    }
    
    @IBAction func recoveryPasswordPressed(_ sender: UIButton) {
        
        userNameTextField.text  = user.userName
        passwordTextField.text  = user.password
        
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        
        if userNameTextField.text == user.userName  , passwordTextField.text == user.password
        {
            PushViewControler(to: AddProductVC(), navigationController: self.navigationController, identifier: StoryBoard.AddProductScreen)
        }else{
            print("nooo")
        }
        
       
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
                
    }
    

    
    
}

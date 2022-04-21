//
//  ViewController.swift
//  Skill-Test
//
//  Created by Oday Dieg on 17/04/2022.
//

import UIKit


public func PushViewControler(to ViewController: UIViewController , navigationController: UINavigationController? , identifier:String){
    
    let storyBoard : UIStoryboard = UIStoryboard(name: StoryBoard.MainStory, bundle:nil)
    let ViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
    navigationController?.pushViewController(ViewController, animated: true)
    
}


class SplashViewControler: UIViewController {
    
    
    @IBOutlet weak var splashMainImage: UIImageView!
    @IBOutlet weak var discoverDreamLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupStackButtons()
        
    }
    
    private func SetupStackButtons(){
        buttonsStackView.layer.cornerRadius     = 20
        buttonsStackView.layer.masksToBounds    = true
        buttonsStackView.clipsToBounds          = true
    }
    
    
    
    
    
    @IBAction func SignUpButtonPressed(_ sender: UIButton) {
        
        PushViewControler(to: LoginViewController(), navigationController: self.navigationController, identifier: StoryBoard.LoginScreen)
   
    }
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        PushViewControler(to: LoginViewController(), navigationController: self.navigationController, identifier: StoryBoard.LoginScreen)
    }
    

    
}


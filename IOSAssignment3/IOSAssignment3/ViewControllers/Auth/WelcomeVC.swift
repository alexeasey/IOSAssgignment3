//
//  WelcomeVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//


import UIKit

class WelcomeVC: BaseClass {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        print(#function)
        pushVC(nameOfVC: LoginVC.id, storyboardName: .Main)
        
    }
    @IBAction func signUpBtnPressed(_ sender: Any) {
        print(#function)
        pushVC(nameOfVC: SignupVC.id, storyboardName: .Main)
        
    }
    
}

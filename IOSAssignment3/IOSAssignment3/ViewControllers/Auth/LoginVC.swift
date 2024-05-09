//
//  LoginVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//


import UIKit
import FirebaseCore
import FirebaseAuth


class LoginVC: BaseClass{
    @IBOutlet weak var paswordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    var paswordHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paswordTF.isSecureTextEntry = true
        emailTF.setLeftPaddingPoints(20)
        paswordTF.setLeftPaddingPoints(20)
        
    }
    
    @IBAction func showPswrdPressed(_ sender: Any) {
        guard paswordTF.text != nil, !paswordTF.text!.isEmpty else {
            showAlert(msg: "Nothing To Show in Password")
            return
        }
        paswordHidden.toggle()
        paswordTF.isSecureTextEntry = paswordHidden
    }
    
    @IBAction func loginBtnPresed(_ sender: Any) {
        print(#function)
       
        self.startLoading()
        Auth.auth().signIn(withEmail: emailTF.text!, password: paswordTF.text!) { authResult, error in
            if let error = error {
                self.startLoading()
                self.showAlert(title: AlertConstants.Error, msg: error.localizedDescription, btn: AlertConstants.Ok)
                print("Error sign In User \(error.localizedDescription)")
                self.stopLoading()
            } else {
                self.stopLoading()
                self.pushVC(nameOfVC: TabbarVC.id, storyboardName:.App)
//                self.showAlertWithClosure(title: AlertConstants.Success, message: AlertConstants.LoginSuccess, onSuccess: {
//                    self.pushVC(nameOfVC: TabbarVC.id, storyboardName:.App)
                    UserDefaults.standard.setValue(true, forKey: UDKeys.isUserRegisted)
//                    print("User created successfully")
//                })
            }
        }
    }
    

    @IBAction func forgetPaswordBtnPressed(_ sender: Any) {
        pushVC(nameOfVC: ForgetPasswordVC.id, storyboardName: .Main)
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
       goBack()
    }
}

//
//  SignupVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class SignupVC: BaseClass {
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var paswordHidden = false
    var uid = ""
    var email = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.setLeftPaddingPoints(20)
        emailTF.setLeftPaddingPoints(20)
        passwordTF.setLeftPaddingPoints(20)
        confirmPasswordTF.setLeftPaddingPoints(20)
        passwordTF.isSecureTextEntry = true
        
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        self.startLoading()
        
        guard let email = emailTF.text, let password = passwordTF.text, let name = nameTF.text,
              !name.isEmpty , !email.isEmpty, !password.isEmpty , email.isValidEmail else {
            self.stopLoading()
            showAlert(title:AlertConstants.Error, msg: AlertConstants.FillAll, btn: AlertConstants.Ok)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                
                self.showAlert(title: AlertConstants.Error, msg: error.localizedDescription, btn: AlertConstants.Ok)
                
                print("Error creating user: \(error.localizedDescription)")
                self.stopLoading()
                
            } else {
                print("User created successfully")
                let params = [
                    "uid":self.uid,
                    "parentId":self.uid,
                    "name": name,
                    "email": email,
                    "password":password,
                    "phone": "",
                    "bio":"",
                    "address":"",
                    "logoImg": "",
                    "profileImg": "",
                    "coverImg": ""
                ]
                print(params)
                
                if let uid = authResult?.user.uid {
                    Database.database().reference().child("User").child(uid).setValue(params)
                    UserDefaults.standard.setValue(true, forKey: UDKeys.isUserRegisted)
                    
                    DataManager.shared.saveUID(uid: uid)
                    DataManager.shared.saveParams(parms: params)
                    self.stopLoading()
                    self.showAlert(title: AlertConstants.Success, msg: "Sign up successful", btn: AlertConstants.Ok)

                }
            }
        }
    }
    
    @IBAction func gotoLoginBtnPressed(_ sender: Any) {
        goBack()
    }
}

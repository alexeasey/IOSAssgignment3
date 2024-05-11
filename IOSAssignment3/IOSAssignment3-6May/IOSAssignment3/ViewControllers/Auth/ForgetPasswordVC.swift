//
//  ForgetPasswordVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//


import UIKit
import FirebaseAuth

class ForgetPasswordVC: BaseClass {
    
    @IBOutlet weak var emaiTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emaiTextField.setLeftPaddingPoints(20)
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        guard let email = emaiTextField.text, !email.isEmpty else {
            showAlert(msg: AlertConstants.EmailEmpty)
            return
        }
     //   startLoading()
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error == nil {
                self.showAlertWithClosure(title: "Alert", message: "Check your email to reset password.", onSuccess: {
                    self.navigationController?.popViewController(animated: true)
                })
            } else {
      //          self.stopLoading()
                self.showAlert(msg: error!.localizedDescription)
            }
        }
        
    }
}

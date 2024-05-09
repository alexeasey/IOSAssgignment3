//
//  ProfileVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//

import UIKit
import FirebaseAuth

class ProfileVC: BaseClass {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            
            UserDefaults.standard.setValue(false, forKey: UDKeys.isUserRegisted)
            
            print("User Logout Successfull")
            
            self.pushVC(nameOfVC: WelcomeVC.id, storyboardName: .Main)
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
}

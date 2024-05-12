//
//  CreateJobs.swift
//  IOSAssignment3
//
//  Created by Umer on 11/05/2024.
//

import UIKit
import FirebaseAuth

class SettingsVC: BaseClass {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
     //   goBack()
    }
    
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        goBack()
        
    }
    
    @IBAction func createJobPressed(_ sender: Any) {
        pushVC(nameOfVC: CreateJobVC.id, storyboardName:.Basic)
        
    }
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        pushVC(nameOfVC: ProfileVC.id, storyboardName:.Basic)
    }
    
    @IBAction func otherBtnPressed(_ sender: Any) {
        //LogoutBtnpressed
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

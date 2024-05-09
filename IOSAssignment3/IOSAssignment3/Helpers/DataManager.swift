

import UIKit

class DataManager {
    
    // Singelton Class
    static let shared = DataManager()
   //Singelton Initializer
    private init () {}
   
    func saveUID(uid: String) {
        return UserDefaults.standard.set(uid, forKey: UDKeys.uid)
    }

    func getUID() -> String? {
        return UserDefaults.standard.value(forKey: UDKeys.uid) as? String
    }

    func saveParams(parms : [String:Any]) {
        return UserDefaults.standard.set(parms, forKey: "saveParams")
    }
    
    func getParams() -> String? {
        return UserDefaults.standard.value(forKey: "getParams") as? String
    }
    
    func saveUserToUserDefaults() {
        
    }

}

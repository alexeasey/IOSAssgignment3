
import Foundation
import FirebaseDatabase
import FirebaseAuth
//import FirebaseStorage


enum AppStoryboard : String {
    case App
    case Main
    case Basic
}

struct UDKeys {
    
    static let userInfo = "UserInfo"
    static let uid = "firebaseUID"
    static let userID = "userID"
    static let postID = "postID"
    static let isUserRegisted = "isUserRegisted"
    
}

struct dbRef {
    static let rootRef = Database.database().reference()
    static let user = rootRef.child("Jobs")
  //  static let storageRef = Storage.storage().reference()
    
}

internal struct AlertConstants {
    static let Error = "Error!"
    static let FillAll = "Fill All Fields "
    static let Alert = "Alert"
    static let DeviceType = "ios"
    static let Ok = "Ok"
    static let EmailNotValid = "Email is not valid."
    static let PhoneNotValid = "Phone number is not valid."
    static let EmailEmpty = "Email is empty."
    static let PhoneEmpty = "Phone number is empty"
    static let FirstNameEmpty = "First name is empty"
    static let LastNameEmpty = "Last name is empty"
    static let NameEmpty = "Name is empty"
    static let Empty = " is empty"
    static let PasswordsMisMatch = "Make sure your passwords match"
    static let LoginSuccess = "Login successful"
    static let SignUpSuccess = "Signup successful"
    static let emailPasswordInvalid = "Email or password is not valid"
    static let PasswordEmpty = "Password is empty"
    static let shortPassword = "Password must be atleast 6 digits"
    static let Success = "Success"
    static let notFoundUrl = "URL is not found!"
    static let UnknownError = "Unknown Erorr Occoured!"
    static let JobCreated = "Job Created Successfully"
    static let noImageFound = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png"
}

struct UserProfile: Codable {
    var uid: String
    var name: String
    var email: String
    var password: String
    var phone: String
    var bio: String
    var address: String
    var logoImg: String
    var profileImg: String
    var coverImg: String
    
    // Initialize from a dictionary
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.password = dictionary["password"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.logoImg = dictionary["logoImg"] as? String ?? AlertConstants.noImageFound
        self.profileImg = dictionary["profileImg"] as? String ?? AlertConstants.noImageFound
        self.coverImg = dictionary["coverImg"] as? String ?? AlertConstants.noImageFound
        self.phone = dictionary["phone"] as? String ?? ""
    }
}

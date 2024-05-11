
import Foundation

// MARK: - LoginUser
struct LoginUserStruct: Codable {
    let status: Bool?
    let user: User?
    let token, message: String?

    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

}

// MARK: - UserData Who is Loged In
struct User: Codable {
    let id: Int?
    let name, username, email, bio: String?
    let fcmToken, deviceType: String?
    let loginWith: String?
    let profilePicture, coverPicture: String?
    let address: String?
    let status: Int?
    let emailVerifiedAt: String?
    let createdAt, updatedAt: String?
    let posts: [PostOfLoginedUser]?
    let follower, following: [Follow]?
    let likes: [Like]?
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }


    enum CodingKeys: String, CodingKey {
        case id, name, username, email, bio
        case fcmToken = "fcm_token"
        case deviceType = "device_type"
        case loginWith = "login_with"
        case profilePicture = "profile_picture"
        case coverPicture = "cover_picture"
        case address, status
        case emailVerifiedAt = "email_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case posts, follower, following, likes
    }
}

// MARK: - PostOfLoginedUser -  Post of the user who is Loged In
struct PostOfLoginedUser: Codable {
    let id, userID, categoryID: Int?
    let compareWith: String?
    let media: String?
    let title, body, mediaType: String?
    let download: Int?
    let createdAt, updatedAt: String?
    let likes: [Like]?
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }


    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case categoryID = "category_id"
        case compareWith = "compare_with"
        case media, title, body
        case mediaType = "media_type"
        case download
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case likes
    }
}

// MARK: - Follow
struct Follow: Codable {
    let id, followingUserID, followedUserID: Int?
    let createdAt, updatedAt: String?

    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

    enum CodingKeys: String, CodingKey {
        case id
        case followingUserID = "following_user_id"
        case followedUserID = "followed_user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


// MARK: - Follower
struct Follower: Codable {
    let id, followingUserID, followedUserID: Int?
    let createdAt, updatedAt: String?
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

    enum CodingKeys: String, CodingKey {
        case id
        case followingUserID = "following_user_id"
        case followedUserID = "followed_user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
//===============================================================//

// MARK: - HomePost API Structure -  HomeVC
struct HomePageAPI: Codable {
    let post: HomePosts?
    let message: String?
    let status: Bool?
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

}

// MARK: - Post
struct HomePosts: Codable {
    let currentPage: Int?
    let data: [SinglePost]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let links: [Link]?
    let nextPageURL, path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?

    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct SinglePost: Codable {
    let id, userID, categoryID: Int?
    let compareWith: String?
    let media: String?
    let title: String?
    let body: String?
    let mediaType: String?
    let download: Int?
    let createdAt, updatedAt, name: String?
    let profilePicture: String?
    let likesCount: Int?
    let comments: [Comment]?
    let compares: [String]?

    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case categoryID = "category_id"
        case compareWith = "compare_with"
        case media, title, body
        case mediaType = "media_type"
        case download
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
        case profilePicture = "profile_picture"
        case likesCount = "likes_count"
        case comments, compares
    }
}

// MARK: - Comment
struct Comment: Codable {
    let id: Int?
    let userID, postID: String?
    let commentID: String?
    let image: String?
    let body, createdAt, updatedAt: String?

    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case postID = "post_id"
        case commentID = "comment_id"
        case image, body
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }

}

//=============================================================

// MARK: - Explore  -  Explore Catagory for ExploreVC
struct Explore: Codable {
    let message: String?
    let status: Bool?
    let category: [ExploreCatagory]?
}

// MARK: - Category
struct ExploreCatagory: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let createdAt, updatedAt: String?
    let likesCount: Int?
    let posts: [PostOfCatagory]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case likesCount = "likes_count"
        case posts
    }
}

// MARK: - PostOfCatagory
struct PostOfCatagory: Codable {
    let id, userID, categoryID: Int?
    let compareWith: String?
    let media: String?
    let title: String?
    let body: String?
    let mediaType: String?
    let download: Int?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case categoryID = "category_id"
        case compareWith = "compare_with"
        case media, title, body
        case mediaType = "media_type"
        case download
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

//==================================================

// MARK: - UserProfileDetails -  For MyProfileVC and other Users Profile Details by ID.

// Define the root structure
struct UserDetailsResponse: Codable {
    var status: Bool?
    var message: String?
    var user: UserDetails?
}

// Define the UserDetails structure
struct UserDetails: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var bio: String?
    var fcmToken: String?
    var deviceType: String?
    var loginWith: String?
    var profilePicture: String?
    var coverPicture: String?
    var address: String?
    var status: Int?
    var emailVerifiedAt: String?
    var createdAt: String?
    var updatedAt: String?
    var followerCount: Int?
    var likesCount: Int?
    var followingCount: Int?
    var postsCount: Int?
    var posts: [UsersPost]?

    private enum CodingKeys: String, CodingKey {
        case id, name, username, email, bio, address, status, posts
        case fcmToken = "fcm_token"
        case deviceType = "device_type"
        case loginWith = "login_with"
        case profilePicture = "profile_picture"
        case coverPicture = "cover_picture"
        case emailVerifiedAt = "email_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case followerCount = "follower_count"
        case likesCount = "likes_count"
        case followingCount = "following_count"
        case postsCount = "posts_count"
    }
}

// Define the Post structure
struct UsersPost: Codable {
    var id: Int?
    var userId: Int?
    var categoryId: Int?
    var compareWith: String?
    var media: String?
    var title: String?
    var body: String?
    var mediaType: String?
    var download: Int?
    var createdAt: String?
    var updatedAt: String?
    var likes: [Like]?

    private enum CodingKeys: String, CodingKey {
        case id, media, title, body, likes, download
        case userId = "user_id"
        case categoryId = "category_id"
        case compareWith = "compare_with"
        case mediaType = "media_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// Define the Like structure
struct Like: Codable {
    var id: Int?
    var postId: Int?
    var userId: Int?
    var commentId: Int?
    var categoryId: Int?
    var createdAt: String?
    var updatedAt: String?

    private enum CodingKeys: String, CodingKey {
        case id, postId, userId, commentId, categoryId
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

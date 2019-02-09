//
//  Constants.swift
//  smack-app
//
//  Created by Reden John Zarra on 07/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> () // typealias is like assigning a name to Type (Custom Type Name)

// Segues
let TO_LOGIN = "to_login"
let TO_CREATE_ACCT = "to_create_account"
let UNWIND_TO_CHANNEL = "unwind_to_channel"
let TO_AVATAR_PICKER = "to_avatar_picker"

// Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

// Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChange")

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// URL Constants
let BASE_URL = "https://smackchaton.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"

// URL Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

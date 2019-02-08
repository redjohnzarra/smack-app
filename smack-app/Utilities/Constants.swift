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

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// URL Constants
let BASE_URL = "https://smackchaton.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"

// URL Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

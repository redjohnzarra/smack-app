//
//  UserDataService.swift
//  smack-app
//
//  Created by Reden John Zarra on 08/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = "" // Other Classes cannot set this value
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func getUIColor(components: String) -> UIColor {
        // ["0.5", "0.5", "0.5", 1]
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ") // Characters skipped
        let comma = CharacterSet(charactersIn: ",")// Stopping character
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r) // & to go to variable `r`
        scanner.scanUpToCharacters(from: comma, into: &g) // & to go to variable `g`
        scanner.scanUpToCharacters(from: comma, into: &b) // & to go to variable `b`
        scanner.scanUpToCharacters(from: comma, into: &a) // & to go to variable `a`
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defaultColor }
        guard let gUnwrapped = g else { return defaultColor }
        guard let bUnwrapped = b else { return defaultColor }
        guard let aUnwrapped = a else { return defaultColor }
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        return UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
    }
}

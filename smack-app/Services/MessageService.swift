//
//  MessageService.swift
//  smack-app
//
//  Created by Reden John Zarra on 12/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                // Swift JSON New // Make Model Decodable and names should be the same with the same order and must have everything that the API returns
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
//
//                print(self.channels)
                
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    print("sample here",self.channels)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

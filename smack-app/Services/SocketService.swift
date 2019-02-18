//
//  SocketService.swift
//  smack-app
//
//  Created by Reden John Zarra on 12/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription) //based on server socket (including parameters order)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) { // ack for socket acknowledgement
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDes = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDes, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        } // based on server socket [Any] - (including parameters order)
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        
        completion(true)
    }
    
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        socket.on("messageCreated") { (dataArray, ack) in
            guard let channelId = dataArray[2] as? String else { return }
            guard let messageBody = dataArray[0] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            let newMessage = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
            
            completion(newMessage)
            // If the incoming message is part of the channel that we selected
//            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
//                guard let messageBody = dataArray[0] as? String else { return }
//                guard let userName = dataArray[3] as? String else { return }
//                guard let userAvatar = dataArray[4] as? String else { return }
//                guard let userAvatarColor = dataArray[5] as? String else { return }
//                guard let id = dataArray[6] as? String else { return }
//                guard let timeStamp = dataArray[7] as? String else { return }
//
//                let newMessage = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
//
////                MessageService.instance.messages.append(newMessage)
//                completion(newMessage)
//            } else {
//                completion(false)
//            }
        }
    }
    
    // with new completion handler
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return } // a dictionary returned based on api socket
            completionHandler(typingUsers)
        }
    }
}

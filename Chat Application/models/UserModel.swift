//
//  UserModel.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation


struct UserModel:Codable{
    
    var username:String
    var password:String
    init( username:String, password:String) {
        self.username=username
        self.password=password
    }
    func sendMessage(messageText:String,delegate:SocketDelegate)  {
        let message = Message(messageText: messageText, messageDate: Date(), username: self.username)
        delegate.socketDidEmitEvent(event: "chatMessage", message: message)
}
}

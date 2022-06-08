//
//  MessageModel.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation

class Message:Decodable,Encodable{
    var messageText:String
    var messageDate:Date
    var username:String
    init(messageText:String,messageDate:Date,username:String) {
        self.messageText=messageText
        self.username=username
        self.messageDate=messageDate
    }
    
}

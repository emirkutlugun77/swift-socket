//
//  SocketManager.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 4.06.2022.
//

import Foundation
import SocketIO

protocol SocketDelegate{
    func socketDidGetEvent(message:Message)
    func socketDidEmitEvent(event:String,message:Message)
    func socketDidStartedConnection()
    func socketDidEndedConnection()
}


class SocketHelper{
    
    let manager = SocketManager(socketURL: URL(string: "https://socket-app-attempt.herokuapp.com/")!, config: [.log(true), .compress])
    var socket:SocketIOClient!
    var delegate:SocketDelegate?
    init() {
        socket=manager.defaultSocket
    }
    func addHandlers() {
           socket.on("chatMessage") {data, ack in
              
               let jsonString:String = data.first as! String
               let jsonData = Data(jsonString.utf8)
            let decoder = JSONDecoder()
               let message = try! decoder.decode(Message.self, from: jsonData)
               self.delegate?.socketDidGetEvent(message:message)
               return
           }
    }
  
}

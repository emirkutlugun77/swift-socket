//
//  SocketExtensionn.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation
import SocketIO

extension ViewController:SocketDelegate{
    func socketDidGetEvent(message: Message) {
        self.messages.append(message)
        self.tableView.reloadData()
        
    }
    
    func socketDidEmitEvent(event: String, message: Message) {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(message)
        let json = String(data: jsonData, encoding: .utf8)
        print(json)
        socketHelper.socket.emit(event, json as! SocketData, completion: {
           } )
       
           textField.text=""
            
           self.view.endEditing(true)
    }
    
 
    
 
    
    func socketDidStartedConnection() {
        print("socketStartedConnection")
    }
    
    func socketDidEndedConnection() {
        print("socketDidEndedConnection")
    }
    
    
}
//func socketDidGetEvent(message: Message) {
//    appendMessage(message)
//}
//
//
//func socketDidEmitEvent(event eventName:String,message:Message) {
//
//}

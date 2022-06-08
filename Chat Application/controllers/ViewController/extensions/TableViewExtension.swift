//
//  TableViewExtension.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation
import UIKit

extension ViewController:UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
   }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.label.text = message.messageText
        
        //This is a message from the current user.
        if message.username == user?.username {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor.systemTeal
            cell.label.textColor = UIColor.white
        }
        //This is a message from another sender.
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor.systemGray6
            cell.label.textColor = UIColor.white
        }
        
      
      
        return cell
    }
   
   func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return CGFloat(15.0)
   }
   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       let v = UIView()
       v.backgroundColor = .clear
       return v
   }
    
}



extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}



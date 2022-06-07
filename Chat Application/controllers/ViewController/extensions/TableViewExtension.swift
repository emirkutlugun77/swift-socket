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
       print("FAPKDFFKAFJDADA")
           let cell = tableView.dequeueReusableCell(withIdentifier: "messages",for: indexPath)
       cell.textLabel?.text = messages[indexPath.row].username
       cell.largeContentTitle? = messages[indexPath.row].messageText
       
       cell.layer.cornerRadius = 50
       let colorSwitch = user?.username == messages[indexPath.row].username
       
       if colorSwitch{
          
           cell.backgroundColor = .systemBlue
       }
       else{
           
           cell.backgroundColor = .systemGray6
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
        return 50
    }
}



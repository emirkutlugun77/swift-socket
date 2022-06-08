//
//  ViewController.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 4.06.2022.
//

import UIKit
import SocketIO
class ViewController: UIViewController {

    var messages:[Message] =  []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var socketHelper=SocketHelper()
    var user:UserModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: "MessageCell", bundle: .main), forCellReuseIdentifier: "ReusableCell")
        textField.delegate=self
        socketHelper.delegate=self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        socketHelper.addHandlers()
        socketHelper.socket.connect()
       
    }
    func appendMessage(_ message: Message) {
       messages.append(message)
       textField.text=""
       self.tableView.reloadData()
       self.view.endEditing(true)
   }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
        self.view.frame.origin.y = 0 - keyboardSize.height
    }
    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        self.user!.sendMessage(messageText: textField.text!, delegate: self.socketHelper.delegate!)
    }
    
}






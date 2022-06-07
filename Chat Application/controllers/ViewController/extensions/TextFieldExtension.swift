//
//  TextFieldExtension.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation
import UIKit
extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.user!.sendMessage(messageText: textField.text!, delegate: self.socketHelper.delegate!)
       return  true
    }
}

//
//  TextFieldExtensionForRegister.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 7.06.2022.
//

import Foundation
import UIKit

extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == usernameLabel){
            print("USERNAME")
        }
        if(textField==passwordLabel){
            print("PASSWORD")
        }
        
        return true
    }
}

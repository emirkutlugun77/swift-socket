//
//  TextFieldExtension.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation
import UIKit

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == userNameField){
            print("USERNAME")
        }
        if(textField==passwordField){
            print("PASSWORD")
        }
        
        return true
    }
}

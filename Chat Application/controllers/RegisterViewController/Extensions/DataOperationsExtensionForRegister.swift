//
//  DataOperationsExtensionForRegister.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 7.06.2022.
//

import Foundation


extension RegisterViewController:DataOperationsDelegate{
    func didTokenReceive(res: ResponseModel) {
        
    }
    
    func didLogin(res: ResponseModel) {
  
          
    }
    
    func didRegister(res: ResponseModel) {
        print(res)
        self.response=res
       self.performSegue(withIdentifier: "registerMethodWorked", sender: self)
    }
    
    
}

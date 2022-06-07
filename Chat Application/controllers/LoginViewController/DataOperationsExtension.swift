//
//  DataOperationsExtension.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation


extension LoginViewController:DataOperationsDelegate{
    func didTokenReceive(res: ResponseModel) {
        
    }
    
    func didLogin(res: ResponseModel) {
  
            print(res)
            self.response=res
           self.performSegue(withIdentifier: "loginMethodWorked", sender: self)
    }
    
    func didRegister(res: ResponseModel) {
        
    }
    
    
}

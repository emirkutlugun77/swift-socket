//
//  DataExtension.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 7.06.2022.
//

import Foundation


extension MainViewController:DataOperationsDelegate{
    func didLogin(res: ResponseModel) {
        
    }
    
    func didRegister(res: ResponseModel) {
        
    }
    
   
    
    func didTokenReceive(res: ResponseModel) {
        self.response=res
        self.performSegue(withIdentifier: "tokenNotNull", sender: self)
    }
    
    
}

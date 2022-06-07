//
//  LoginViewController.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var response:ResponseModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate=self
        passwordField.delegate=self
        DataOperationsModel.dataOperationsModel.delegate=self
    }
    

   
   //  MARK: - Navigation

    @IBAction func loginButtonPressed(_ sender: UIButton) {
       
        DataOperationsModel.dataOperationsModel.loginUser(username: userNameField.text!, password: passwordField.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginMethodWorked"){
            let chatVC = segue.destination as! ViewController
            let user:UserModel = UserModel(username: response!.data.user.username, password: response!.data.user.password)
            chatVC.user=user
            
        }
      
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
    }
   
}

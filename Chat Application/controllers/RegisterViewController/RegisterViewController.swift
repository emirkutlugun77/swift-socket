//
//  RegisterViewController.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    var response:ResponseModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.delegate=self
        passwordLabel.delegate=self
        DataOperationsModel.dataOperationsModel.delegate=self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        DataOperationsModel.dataOperationsModel.registerUser(username: usernameLabel.text!, password: passwordLabel.text!)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "registerMethodWorked"){
            let chatVC = segue.destination as! ViewController
            let user:UserModel = UserModel(username: response!.data.user.username, password: response!.data.user.password)
            chatVC.user=user
            
        }
    }
   

}

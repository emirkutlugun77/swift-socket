//
//  MainViewController.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    var token:String?
    var response:ResponseModel?
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerViewButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        DataOperationsModel.dataOperationsModel.delegate=self
        let defaults = UserDefaults.standard
        token = defaults.string(forKey: "token")
        if(token != nil){
            DataOperationsModel.dataOperationsModel.getUser(token: token!)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tokenNotNull"{
            let chatVC = segue.destination as! ViewController
            let user = UserModel(username:response!.data.user.username,password: response!.data.user.password)
            chatVC.user=user
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}


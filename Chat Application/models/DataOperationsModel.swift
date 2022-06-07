//
//  DataOperationsModel.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 6.06.2022.
//

import Foundation
import Alamofire


protocol DataOperationsDelegate{
    func didLogin(res:ResponseModel)
    func didRegister(res:ResponseModel)
    func didTokenReceive(res:ResponseModel)
}

class DataOperationsModel{
    
    static let dataOperationsModel=DataOperationsModel()
    let apiUrl = ProcessInfo.processInfo.environment["API_URL"]!
    var delegate:DataOperationsDelegate?
    let defaults = UserDefaults.standard
    func generateRequest(method:HTTPMethod , url:URL , payloadParameters:[String:Any]? = nil, token:String? = nil)->URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if token != nil{
            request.headers.add(HTTPHeader.authorization(bearerToken: token!))
        }
       
        if(payloadParameters != nil){
            do {
               // convert parameters to Data and assign dictionary to httpBody of request
               request.httpBody = try JSONSerialization.data(withJSONObject: payloadParameters!, options: .prettyPrinted)
             } catch let error {
               print(error.localizedDescription)
                
             }
        }
       
        return request
    }
    func loginUser(username:String,password:String){
      
        var responseModel:ResponseModel?
       
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string:self.apiUrl+"auth-service/loginUser")!
            let request = self.generateRequest(method: HTTPMethod.post, url: url, payloadParameters: ["username":username,"password":password])
            AF.request(request).validate().responseJSON{ response in
                    responseModel = try? JSONDecoder().decode(ResponseModel.self, from: response.data! )
                
                self.defaults.set(responseModel?.data.token,forKey:"token")
                self.delegate?.didLogin(res: responseModel!)
            }
        }
    
      
        
      
    }
    func registerUser(username:String,password:String){
        var responseModel:ResponseModel?
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: self.apiUrl+"auth-service/registerUser")!
            let request = self.generateRequest(method: HTTPMethod.post, url: url, payloadParameters: ["username":username,"password":password])
        AF.request(request).validate().responseJSON{response in
             responseModel = try? JSONDecoder().decode(ResponseModel.self,from:response.data!)
           
            self.defaults.set(responseModel?.data.token,forKey:"token")
            self.delegate?.didRegister(res: responseModel!)
        }
        }
    }
    func getUser(token:String){
        var responseModel:ResponseModel?
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: self.apiUrl+"auth-service/getMe")!
            let request = self.generateRequest(method: HTTPMethod.get, url: url, token:token)
        AF.request(request).validate().responseJSON{response in
            responseModel = try? JSONDecoder().decode(ResponseModel.self,from:response.data!)
            self.defaults.set(responseModel?.data.token,forKey:"token")
            self.delegate?.didTokenReceive(res: responseModel!)
        }
        }
    }
}


struct ResponseModel: Codable {
    let status: String
    let code: Int
    let userMessage, developerMessage: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass:Codable{
    let user:UserModel
    let token:String
}

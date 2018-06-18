//
//  ImgurRouter.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation

public typealias onCloudResponseRecieved = ( _ apiResponse: Bool, _ serverResponse:  Any? , _ Error : Any) -> ()

public typealias Dict = [String: Any]


class  ImgurRouter : NSObject {
    
   public func getUser( id : Int ,  onCloudResponseRecieved : @escaping onCloudResponseRecieved) {
       
        let urlRequest = try? asURLRequest(requestMethod: RequestMethod.get.rawValue , path: "cats" , parameter: [:])
    
    ApiFetch.shared.getRequest(urlRequest: urlRequest! , onSuccess: { (Response) in
            
            do{
                print(Response)
               
              let imgur = try JSONDecoder().decode(Imgur.self, from: Response)
              onCloudResponseRecieved(true, imgur , "")
            }catch{
                onCloudResponseRecieved(false, nil, "Exception While decoding " )
            }
            
            
        }) { (Error) in
            print(Error)
            onCloudResponseRecieved(false, nil, Error)
            
        }
        
    }
    
    
    
    public func asURLRequest(requestMethod : String , path: String ,parameter: Dict ) throws -> URLRequest {
        
        let url =    URL(string : Constants.baseURLPath )!
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = requestMethod
        request.addValue(Constants.authenticationToken, forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10 * 1000)
        request.httpBody =  try? JSONSerialization.data(withJSONObject: parameter, options: [])
        return request
    }
    
    
}





/*
 let parameter = [
 
 "content_app_id": "",
 "firstname": "",
 "lastname": "lastName",
 "email": "email",
 "mobile": "mobile",
 "username":"userName",
 "password": "password"
 
 ] as [String : Any]
 */

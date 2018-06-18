//
//  ApiFetch.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import UIKit




enum ServiceError: Error {
    case noInternetConnection
    case custom(String)
    case other
}
extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .custom(let message):
            return message
        }
    }
}



class ApiFetch {
    
    private init(){}  // private constructor
    static let shared = ApiFetch()  //shared instance
    let session = URLSession.shared
    
    func getRequest( urlRequest : URLRequest , onSuccess: @escaping(Data) -> Void, onFailure: @escaping(Any) -> Void) {
        
      
        
            
         
        
        session.dataTask(with: urlRequest) { (data,  statuResponse, error) in
            print("ENTERED ApiFetch SESSION TASK")
            
            
            guard let statuResponse = statuResponse as? HTTPURLResponse else {
               // completion(.failure(.other))
                return
            }
            
            if (200..<300) ~= statuResponse.statusCode {
                //completion(Result(value: data.flatMap(resource.parse), or: .other))
            } else if statuResponse.statusCode == 401 {
                //completion(.failure(.unauthorized))
                 onFailure(ServiceError.other)
            } else {
                //completion(.failure(data.flatMap(resource.parseError).map({.custom($0)}) ?? .other))
            }
            
            
            if let data = data {
            
                let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(responseString ?? "Default response string")
                onSuccess(data)
            }else{
                print("API FETCH ERRROR  =\(String(describing: error))")
                onFailure(error!)
            }
            
            }.resume()
        
        
        
    }
    
    
    
    func downloadImage(imgUrl:String , onSucess: @escaping (UIImage) -> Void) {
      //  let imageCachae = ImageCache()
        guard let url = URL(string: imgUrl) else {return}
        
//       if let imageFromCache =  imageCachae.image(forKey: imgUrl) {
//           DispatchQueue.main.async {
//             onSucess(imageFromCache)
//            }
//        }
        session.dataTask(with: url) { (data, statuResponse, error) in
            
            
            if let data = data {
                
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data) else {return}
                    //imageCachae.add(image, forkey: imgUrl)
                    //imageCachae.setObject(image, forKey: url as AnyObject)
                    onSucess(image)
                }
                
            }else{
                print("ERRRROOORRRRRRRR   :  \n error =  \(error )   \n   imgUrl = \(imgUrl) \n")
                let blankImg = UIImage(named: "blankImg")!
                 onSucess(blankImg)
                
            }
        }.resume()
    }
}




//
//  AlertView.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import UIKit

class AlertView {
    
    static func show(_ controller : UIViewController  , message : String ){
        DispatchQueue.main.async {
            let alert =   UIAlertController.init(title: "Alert", message: message, preferredStyle: .alert)
            let action =  UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            controller.present(alert, animated: true, completion: nil)
        }
        
        
    }
}

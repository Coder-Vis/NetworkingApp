//
//  ImageCache.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import UIKit
class ImageCache: NSCache<AnyObject , AnyObject>{
    
    func add(_ image : UIImage , forkey key : String ){
        setObject(image, forKey: key as AnyObject)
        
    }
    
    
    func image(forKey key : String) -> UIImage?{
        guard let image = object(forKey: key as AnyObject) as? UIImage else {return nil}
        return image
    }
}

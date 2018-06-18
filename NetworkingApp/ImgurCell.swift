//
//  ImgurCell.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import UIKit

class ImgurCell: UICollectionViewCell {
    let  imageCache = ImageCache()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(title:String,imageUrl:String){
        
        let imageCachae = ImageCache()
        self.titleLabel.text = title
        
        if let imageFromCache =  imageCachae.image(forKey: imageUrl) {
            DispatchQueue.main.async {
                self.imageView.image = imageFromCache
            }
        }else{
            
            
            ApiFetch.shared.downloadImage(imgUrl: imageUrl) { (image) in
                DispatchQueue.main.async {
                    self.imageView.image = image
                    imageCachae.add(image, forkey: imageUrl)
                    
                    
                }
                
            }
            
            
            
        }
        
    }
    
    
    
    
    override func prepareForReuse() {
        self.imageView.image = nil
        self.titleLabel.text = nil
    }
}


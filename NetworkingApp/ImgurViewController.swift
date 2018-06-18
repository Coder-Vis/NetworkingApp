//
//  ViewController.swift
//  NetworkingApp
//
//  Copyright © 2018 Team Vis. All rights reserved.
//

import UIKit

class ImgurViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    
    let imgurRouter = ImgurRouter()
    
    let imgurArray = Imgur.self
    
    
    var imgurDataArray:[DataRes] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //activityIndicatorView.startAnimating()
        if !Reachability.isConnectedToNetwork() {
            AlertView.show( self, message: ServiceError.noInternetConnection.localizedDescription)
        }
        imgurRouter.getUser(id: 0) { (isSuccess, apiResponseModel , errorMsg) in
        
            if isSuccess {
                
                guard let imgurRes = apiResponseModel as? Imgur else {return}
                
                guard let imgurData =  imgurRes.data  else {return}
                
                self.imgurDataArray = imgurData
                DispatchQueue.main.async {
                    //self.activityIndicatorView.stopAnimating()
                }
                
           }else{
                
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


extension ImgurViewController: UICollectionViewDataSource {
    
   
    /// required
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgurDataArray.count
    }
    
     /// required
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgurCell", for: indexPath) as? ImgurCell else { return UICollectionViewCell() }
        
        cell.configureCell(title: self.imgurDataArray[indexPath.row].title , imageUrl: self.imgurDataArray[indexPath.row].link)
        return cell
    }
}

extension ImgurViewController: UICollectionViewDelegate {
    
}

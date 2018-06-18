//
//  RequestHeaderBuilder.swift
//  NetworkingApp
//
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation

public class RequestHeaderBuilder : NSObject {
    
    
    public func requestHeaderCreator(headerModel: Any?) -> NSDictionary?
    {
        
        let header:NSDictionary = ["Accept":"application/json","Content-type":"application/json"];
        
        return header;
    }
    
    public func requestHeaderWithAuthCreator() -> NSMutableDictionary?
    {
        let header:NSMutableDictionary = ["Accept":"application/json","Content-type":"application/json"];
        header.setValue( Constants.authenticationToken , forKey: "Authorization");
        return header;
    }
    
    
    
}

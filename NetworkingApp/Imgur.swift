//
//  Imgur.swift
//  NetworkingApp
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation


 class Imgur : Codable{
   
    
    let data : [DataRes]?
    let success : Bool?
    let status : Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case success
        case status
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([DataRes].self, forKey: .data)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }
    
    

    
    
}

class DataRes : Codable {
    
    
    let id : String
    let title : String
    let link : String
    
    enum CodingKeys : String , CodingKey {
        case id
        case title
        case link
    }
    required  init(from decoder : Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id =  try container.decodeIfPresent(String.self , forKey:  .id) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
    }
    
  
}



/*
 \
 let company: Company!
 let email: String!
 let id: Int!
 let name: String!
 let phone: String!
 let username: String!
 let websitee: String!
 
 private enum CodingKeys : String , CodingKey {
 case company
 case email
 case id
 case name
 case phone
 case username
 case websitee
 
 }
 
 required init(from decoder: Decoder) throws
 {
 /*  decodeIfPresent - try to decode only if daata is present
 self.company = try container.decode(Company.self, forKey: .company)
 self.company = try container.decodeIfPresent(Company.self, forKey: .company)
 */
 
 let container = try decoder.container(keyedBy: CodingKeys.self)
 self.company = try container.decodeIfPresent(Company.self, forKey: .company)
 self.email = try container.decodeIfPresent(String.self, forKey: .email)
 self.id = try container.decodeIfPresent(Int.self, forKey: .id)
 self.name  =  try container.decodeIfPresent(String.self, forKey: .name)  ?? "#"
 self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
 self.username = try container.decodeIfPresent(String.self, forKey: .username)
 self.websitee = try container.decodeIfPresent(String.self, forKey: .websitee) ?? "#"
 
 
 }
 */

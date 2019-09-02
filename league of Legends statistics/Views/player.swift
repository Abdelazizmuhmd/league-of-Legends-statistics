//
//  player.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/1/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
struct player : Codable{
 var   profileIconId: Int
 var   name         : String
 var   puuid        : String
 var   accountID    : String
 var   id           : String
    
  enum CodingKeys : String , CodingKey{
    case name
    case puuid
    case profileIconId
    case accountID
    case id
    }
    init(from decoder: Decoder) throws {
        let valueContainer =  try decoder.container(keyedBy: CodingKeys.self)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.puuid =  try valueContainer.decode(String.self, forKey: CodingKeys.puuid)
        self.profileIconId = try valueContainer.decode(Int.self, forKey: CodingKeys.profileIconId)
        self.id =  try valueContainer.decode(String.self, forKey: CodingKeys.id)
        self.accountID =  try valueContainer.decode(String.self , forKey: CodingKeys.accountID)
    }
}

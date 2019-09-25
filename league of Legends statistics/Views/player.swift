//
//  player.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/1/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
import UIKit
struct player : Codable{
 var playerIconImage : UIImage?
 var   profileIconId: Int
 var   name         : String
 var   puuid        : String
 var   accountId    : String
 var   id           : String
 var   summonerLevel: Int
 var   Ranked       : [ranked]
 var   matchHistory : matchHistory?
  enum CodingKeys : String , CodingKey{
    case name
    case puuid
    case profileIconId
    case accountId
    case id
    case summonerLevel
    }
    init(from decoder: Decoder) throws {
        let valueContainer =  try decoder.container(keyedBy: CodingKeys.self)
        self.name  = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.puuid = try valueContainer.decode(String.self, forKey: CodingKeys.puuid)
        self.profileIconId = try valueContainer.decode(Int.self, forKey: CodingKeys.profileIconId)
        self.id =  try valueContainer.decode(String.self, forKey: CodingKeys.id)
        self.accountId =  try valueContainer.decode(String.self , forKey: CodingKeys.accountId)
        self.summonerLevel =  try valueContainer.decode(Int.self, forKey: CodingKeys.summonerLevel)
        self.Ranked = []
        
        
    }
}

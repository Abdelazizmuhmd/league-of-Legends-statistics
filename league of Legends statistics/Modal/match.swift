//
//  match.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/24/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
struct match:Codable{
    var lane : String
    var gameId: Int
    var champion: Int
    var queue: Int
    enum codingKeys: String, CodingKey{
    case lane
    case gameId
    case champion
    case queue
    }
    init(from decoder: Decoder) throws {
        let valueContainer =  try decoder.container(keyedBy: codingKeys.self)
        self.lane =  try valueContainer.decode(String.self, forKey: codingKeys.lane)
        self.gameId = try valueContainer.decode(Int.self, forKey: codingKeys.gameId)
        self.champion =  try valueContainer.decode(Int.self, forKey: codingKeys.champion)
        self.queue = try valueContainer.decode(Int.self, forKey: codingKeys.queue)
    }
}

struct matchHistory  : Codable{
    var matches : [match]
    enum codingKeys:String,CodingKey {
        case matches
    }
    init(from decoder :Decoder)throws    {
        let valueContainer = try decoder.container(keyedBy: codingKeys.self)
        self.matches = try valueContainer.decode([match].self, forKey: codingKeys.matches)
    }
    
}

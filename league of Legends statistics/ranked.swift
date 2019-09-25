//
//  RankedData.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/11/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
struct ranked:Codable {
    var wins        :Int
    var losses      :Int
    var rank        :String
    var tier        :String
    var leaguePoints:Int
    enum Codingkeys : String ,CodingKey{
        case wins
        case losses
        case rank
        case tier
        case leaguePoints

    }
    init(from decoder: Decoder) throws {
        let valueContainer =  try decoder.container(keyedBy: CodingKeys.self)
        self.wins = try valueContainer.decode(Int.self, forKey: CodingKeys.wins)
        self.losses = try valueContainer.decode(Int.self, forKey: CodingKeys.losses)
        self.rank = try valueContainer.decode(String.self, forKey: CodingKeys.rank)
        self.tier = try valueContainer.decode(String.self, forKey: CodingKeys.tier)
        self.leaguePoints = try valueContainer.decode(Int.self, forKey: CodingKeys.leaguePoints)
    }
}

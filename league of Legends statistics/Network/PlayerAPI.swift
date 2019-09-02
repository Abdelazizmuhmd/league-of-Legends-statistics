//
//  PlayerAPI.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/1/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation

class playerAPI{
    static let canNottFindPlayerNotification = Notification.Name("canNotFindPlayer")
    static let playerApi = playerAPI()
    
    
    
    func fetchPlayerInfo(summonerName : String,completion:  @escaping (player) -> Void){
            let playerInfoApiUrl = URL (string:"https://eun1.api.riotgames.com/lol/summoner/v4/summoners/by-name/\(summonerName)?api_key=RGAPI-0f202b57-d88f-4935-b7d4-0a266e9ddb1f")!
            let task = URLSession.shared.dataTask(with: playerInfoApiUrl){(data,respone,error) in
            let jsonDecoder = JSONDecoder()
            if let data =  data,let  playerInfo = try? jsonDecoder.decode(player.self, from: data){

                completion(playerInfo)
            }else{
             NotificationCenter.default.post(name: playerAPI.canNottFindPlayerNotification, object: nil)
            }
        }
           task.resume()
    }
    
}

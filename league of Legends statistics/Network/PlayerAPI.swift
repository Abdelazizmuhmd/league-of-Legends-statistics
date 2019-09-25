//
//  PlayerAPI.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/1/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
import UIKit

class playerAPI{
    static let canNottFindPlayerNotification = Notification.Name("canNotFindPlayer")
    static let playerApi = playerAPI()
    let jsonDecoder = JSONDecoder()
    var region :String = ""
    let  apiKey: String = "RGAPI-c6e807f0-827c-4a69-8473-b0753f27f087"
    
    func fetchPlayerInfo(summonerName : String,region : String,completion:  @escaping (player) -> Void){
        self.region = region
        let playerInfoApiUrl = URL (string:
        "https://\(region).api.riotgames.com/lol/summoner/v4/summoners/by-name/\(summonerName)?api_key=\(apiKey)")!
    
        let task = URLSession.shared.dataTask(with: playerInfoApiUrl){(data,respone,error) in
        
        if let data =  data,let  playerInfo = try? self.jsonDecoder.decode(player.self, from: data){
        completion(playerInfo)}
        
        else{
        NotificationCenter.default.post(name: playerAPI.canNottFindPlayerNotification, object: nil)
        }
        }
        task.resume()
    }
    
    func fetchRankedInfo(Id: String,completion: @escaping ([ranked])->Void){
        
        let rankedInfoApiUrl = URL(string:
        "https://\(region).api.riotgames.com/lol/league/v4/entries/by-summoner/\(Id)?api_key=\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: rankedInfoApiUrl) { (data, respone, error) in
        
        if let data = data,let rankedInfo = try? self.jsonDecoder.decode([ranked].self, from: data){
        completion(rankedInfo)
        }
        }
        task.resume()

    }
    func fetchPlayerIcon(playerIconId:Int,completion: @escaping (UIImage)->Void) {
        
        let ImageIconUrl = URL(string: "https://ddragon.leagueoflegends.com/cdn/9.18.1/img/profileicon/\(playerIconId).png")!
        let task = URLSession.shared.dataTask(with: ImageIconUrl) { (data,respone, error) in
        if let data = data{
        let imageIcon = UIImage(data: data)
        completion(imageIcon!)
        }
        }
        task.resume()
    }
    func fetchMatchHistory(accountId: String,completion: @escaping (matchHistory)->Void){
        let matchUrl = URL(string: "https://\(region).api.riotgames.com/lol/match/v4/matchlists/by-account/\(accountId)?api_key=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: matchUrl) { (data, respone, error) in
            if let data = data,let matchHistory = try? self.jsonDecoder.decode(matchHistory.self, from: data){
                completion(matchHistory)
            }
        }
        task.resume()
    }
    
}

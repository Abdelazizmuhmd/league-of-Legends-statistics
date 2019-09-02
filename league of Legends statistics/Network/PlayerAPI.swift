//
//  PlayerAPI.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 9/1/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import Foundation
class playerAPI{
    
   static let playerApi = playerAPI()
    
    var summonerName : String = "zizoshoow"
    
    func fetchPlayerInfo(completion:  @escaping (player) -> Void){
        let playerInfoApiUrl = URL (string:"https://eun1.api.riotgames.com/lol/summoner/v4/summoners/by-name/zizoshoow?api_key=RGAPI-033cbc54-4c33-4111-91c1-3219669a0d5a")!
        let task = URLSession.shared.dataTask(with: playerInfoApiUrl){(data,respone,error) in
            let jsonDecoder = JSONDecoder()
      
            if let data =  data,let  playerInfo = try? jsonDecoder.decode(player.self, from: data){
                print("sucess")
                completion(playerInfo)
                
            }else{
                print (error)
               
            }
            
           
            
            
        }
     
        task.resume()
        
    }
    
}

//
//  MatchesInfoTableViewController.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 8/26/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import UIKit

class  playerInfoTableViewController: UITableViewController {
    
    var players : [player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerInfoCell", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath){
        let cell = cell as! playerInfoCell
        let player = players[indexPath.row]
        let playerRanked: ranked = player.Ranked[0]
        let totalWinRatio = getWinRatio(wins: Double(playerRanked.wins), lose: Double(playerRanked.losses))
        let playerPostion = getPostion(playerMatchHistory: player.matchHistory!)
        cell.playerNameLabel.text =  player.name
        cell.playerLevelLabel.text = String(player.summonerLevel)
        //make condtions for unranked people
        cell.RankLabel.text = "\(playerRanked.tier)  \(playerRanked.rank)"
        cell.leaguePoint.text = "(\(playerRanked.leaguePoints))"
        cell.allWinsAndLossesAndRatio.text = "(\(playerRanked.wins))(\(playerRanked.losses))(%\(totalWinRatio))"
        cell.imageIcon.image = player.playerIconImage
        cell.rankImageIcon.image = UIImage(named: "\(playerRanked.tier)")
        cell.postionLabel.text = playerPostion
        cell.postionImage.image = UIImage(named:"\(playerPostion)")
       
    }
    func getPostion(playerMatchHistory:matchHistory) -> String{
        var i = 0
        var postions = [String : Int]()
        for match in playerMatchHistory.matches{
            i += 1
            if i==20 {
            break
            }
            switch match.lane{
            case "TOP":
                postions["TOP", default: 0] += 1
            case "BOTTOM":
                postions["BOTTOM", default: 0] +=  1
            case "MID":
                postions["MID", default: 0] += 1
            case "JUNGLE":
                postions["JUNGLE", default: 0] +=  1
            default:
              print("no postion")
            }
        }
        let (postion,_) =  postions.max {a,b in a.value < b.value}!
         return postion
    }
   
    
    
    func getWinRatio(wins:Double ,lose:Double) -> Int {
        let winRatio1 = abs(wins-lose)
        let winRatio2 = wins+lose
        let winRatio3 = winRatio2/2
        let winRatio4 = winRatio1/winRatio3
        let totalWinRatio1 = winRatio4 * 100  
        let totalWinRatio: Int
        if wins>lose{
            totalWinRatio = Int(50 + (totalWinRatio1/4))
        }else{
            totalWinRatio = Int(50 - ((totalWinRatio1)/4))
        }
        return Int(totalWinRatio)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }

   
}

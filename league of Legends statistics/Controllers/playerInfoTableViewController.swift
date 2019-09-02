//
//  MatchesInfoTableViewController.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 8/26/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import UIKit

class  playerInfoTableViewController: UITableViewController {
    
    var players : [player]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerInfoCell", for: indexPath)
        // configure function
        return cell
    }
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath){
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

   
}

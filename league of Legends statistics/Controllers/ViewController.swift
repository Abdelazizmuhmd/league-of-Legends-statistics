//
//  ViewController.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 8/21/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraDetection: UIButton!
  
    @IBOutlet weak var SummonerNameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        summonerNameButtonStyle(buttonStyle: cameraDetection)
        summonerNameButtonStyle(buttonStyle: SummonerNameButton)
      
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func summonerNameButtonStyle (buttonStyle : UIButton){
        buttonStyle.layer.cornerRadius = 30.0
        buttonStyle.layer.borderColor = UIColor.init(hue: 211/360, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
        buttonStyle.layer.borderWidth = 2
    }

}


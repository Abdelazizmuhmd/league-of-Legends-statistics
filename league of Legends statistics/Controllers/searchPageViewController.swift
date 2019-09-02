//
//  ViewController.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 8/21/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import UIKit

class searchPageViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let regions : [String] = ["1","2","3","4","5","6","7","8","9","10","11"]
    

    @IBOutlet weak var cameraDetection: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var SummonerNameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
          picker.delegate = self
        summonerNameButtonStyle(buttonStyle: cameraDetection)
        summonerNameButtonStyle(buttonStyle: SummonerNameButton)
        test()
    }
    
    
    func test(){
        playerAPI.playerApi.fetchPlayerInfo { (player) in
           
            print("2222eewe")
            print(player.accountID)
            
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
    
    
    
    
    
    func summonerNameButtonStyle (buttonStyle : UIButton){
        buttonStyle.layer.cornerRadius = 30.0
        buttonStyle.layer.borderColor = UIColor.init(hue: 211/360, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
        buttonStyle.layer.borderWidth = 2
    }

}


//
//  ViewController.swift
//  league of Legends statistics
//
//  Created by Abdelaziz mohamed on 8/21/19.
//  Copyright © 2019 Abdelaziz mohamed. All rights reserved.
//

import UIKit

class searchPageViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let regions : [String] = ["EUN1","KR","BR1","OC1","LA1","LA2","JP1","NA1","TR1","RU","EUW1"]
    var selectedRowPicker : Int = 0
    var players = [player]()
    @IBOutlet weak var searchTextField: UITextField!
    
   
    @IBOutlet weak var cameraDetection: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var SummonerNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        summonerNameButtonStyle(buttonStyle: cameraDetection)
        summonerNameButtonStyle(buttonStyle: SummonerNameButton)
        NotificationCenter.default.addObserver(self, selector: #selector(alertCanNotFindPlayer),name:playerAPI.canNottFindPlayerNotification, object: nil)

      
    }
    @objc func alertCanNotFindPlayer(){
         DispatchQueue.main.async {
        let alert = UIAlertController(title: "Search", message: "can't find player", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
        alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRowPicker = row
        
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
       
        if let searchText = searchTextField.text{
            playerAPI.playerApi.fetchPlayerInfo(summonerName: searchText,region:regions[selectedRowPicker]) { (player) in
              
                self.players.append(player)
                DispatchQueue.main.async {
                self.performSegue(withIdentifier: "searchPlayerSegue", sender: Any?.self)
                }
            }
            }
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchPlayerSegue"{
            let segueDestination = segue.destination as! playerInfoTableViewController
          
            segueDestination.players = self.players
        }
    }

    func summonerNameButtonStyle (buttonStyle : UIButton){
        buttonStyle.layer.cornerRadius = 30.0
        buttonStyle.layer.borderColor = UIColor.init(hue: 211/360, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
        buttonStyle.layer.borderWidth = 2
    }

}

